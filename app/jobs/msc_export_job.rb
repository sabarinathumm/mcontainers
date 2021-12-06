class MscExportJob < ApplicationJob
    queue_as :default
    puts "MSC"
    def perform(activity_ids) 
        container_count = 0
        item_count = 0
        @activities = Activity.where(id: activity_ids)
        @containers = Container.where(id: @activities.pluck(:container_id))
        interchange = "UNB+UNOA:1+CAVANAE:ZZ+MSC:ZZ+" + (Date.today).to_s + (DateTime.now).to_s + "I'"   
        container_blocks = []

        @containers.each do |container|
            container_count = container_count + 1
            message_header = "UNH+" + container.container_uid+ "+WESTIM:0++0'"
            container_blocks << message_header

            date_time_ref = "DTM+ATR+" + container.created_at.strftime("%d-%b-%Y") + "'"
            container_blocks << date_time_ref

            references = "RFF+EST+" +  + container.created_at.strftime("%d-%b-%Y") + ":0000'"
            container_blocks << references

            alternative_curr_amt_std = "ACA+CAD+STD:0'"
            container_blocks << alternative_curr_amt_std

            alternative_curr_amt_dpp = "ACA+CAD+DPP:0'"
            container_blocks << alternative_curr_amt_dpp

            labour_cost = "LBR+" +  "'"
            container_blocks << labour_cost

            name_addr_receiver = "NAD+LED+MSC'" #or "NAD+DED+CAVANAE’"
            container_blocks << name_addr_receiver

            equipment_details = "EQF+CON+" + (container.container_length_id).to_s + (container.container_type_id).to_s + "'"
            container_blocks << equipment_details

            equipment_related_info = "ERI+ST+MAN:01+ACEP'"
            container_blocks << equipment_related_info

            equipment_condition_info = "ECI+D'"
            container_blocks << equipment_condition_info

            current_usage_info = "CUI+TRM:CAVANAE:ZZ+TRM:" + container.created_at.strftime("%d-%b-%Y") + "+E'"
            container_blocks << current_usage_info

            @activity_items = container.activity_items.where(activity_id: activity_ids)
            @activity_items.each do |item|
                item_count = item_count + 1
                damage = "DAM+" + "+"+ "line" +"+" + item.location + "+"+ Comp.first.name + Dam.first.name + Comp.first.material + "'"
                container_blocks << damage

                work = "WOR+" + Rep.first.name + "+CMT:100:100:1+1'"
                container_blocks << work
                cost = "COS+00+" + item.hours.to_s+ "+" + item.material_cost_cents.to_s+ "+" + "0+" + item.labour_cost_cents.to_s+ "+N'"
                container_blocks << cost

                labour_cost = item.labour_cost_cents 
                material_cost = item.material_cost_cents.to_i

            end
            handling_total = "0.00"
            tax_total = "0.00"
            # puts material_cost
            labour_cost_total = labour_cost * item_count
            materials_cost_total =  materials_cost_total.to_i * item_count
            total_invoice_amt_o = labour_cost_total + materials_cost_total
           

            cost_total_owner = "CTO+O+" + "+" + labour_cost_total.to_s+ "+" + materials_cost_total.to_s + "+"  + "+" + tax_total.to_s + "+" + total_invoice_amt_o.to_s + "'"
            container_blocks << cost_total_owner

            cost_total_user = "CTO+U+0.00+0.00+0.00+0.00+0.00'"
            container_blocks << cost_total_user

            total_message_amt = "TMA+" + (total_invoice_amt_o + 0.00).to_s + "'"
            container_blocks << total_message_amt

            message_trailer = "UNT+" + item_count.to_s + (container.container_uid).to_s
            container_blocks << message_trailer

            # return interchange, message_header, date_time_ref, references, alternative_curr_amt_std, alternative_curr_amt_dpp, labour_cost, name_addr_receiver,  equipment_details, equipment_related_info, equipment_condition_info, current_usage_info 
        end
        interchange_trailer = "UNZ+" + container_count.to_s + "+I'"
        # puts container_blocks
        return interchange, container_blocks, interchange_trailer
    end
end