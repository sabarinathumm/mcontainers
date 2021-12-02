class MscExportJob < ApplicationJob
    queue_as :default
    def perform(activity_ids) 
        container_count = 0
        item_count = 0
        @activities = Activity.where(id: activity_ids)
        @containers = Container.where(id: @activities.pluck(:container_id))
        interchange = "UNB+UNOA:1+CAVANAE:ZZ+MSC:ZZ+" + (Date.today).to_s + (DateTime.now).to_s + "I'"   

        @containers.each do |container|
            container_count = container_count + 1
            message_header = "UNH+" + container.container_uid+ "+WESTIM:0++0'"
            date_time_ref = "DTM+ATR+" + container.created_at.strftime("%d-%b-%Y") + "'"
            references = "RFF+EST+" +  + container.created_at.strftime("%d-%b-%Y") + ":0000'"
            alternative_curr_amt_std = "ACA+CAD+STD:0'"
            alternative_curr_amt_dpp = "ACA+CAD+DPP:0'"
            labour_cost = "LBR+" +  "'"
            name_addr_receiver = "NAD+LED+MSC'" #or "NAD+DED+CAVANAE’"
            equipment_details = "EQF+CON+" + (container.container_length_id).to_s + (container.container_type_id).to_s + "'"
            equipment_related_info = "ERI+ST+MAN:01+ACEP'"
            equipment_condition_info = "ECI+D'"
            current_usage_info = "CUI+TRM:CAVANAE:ZZ+TRM:" + container.created_at.strftime("%d-%b-%Y") + "+E'"

            @activity_items = container.activity_items.where(activity_id: activity_ids)
            @activity_items.each do |item|
                item_count = item_count + 1
                damage = "DAM+" + "+"+ "line" +"+" + item.location + "+"+ Comp.first.name + Dam.first.name + Comp.first.material + "'"
                work = "WOR+" + Rep.first.name + "+CMT:100:100:1+1'"
                cost = "COS+00+" + item.hours.to_s+ "+" + item.material_cost_cents.to_s+ "+" + "0+" + item.labour_cost_cents.to_s+ "+N'"
                labour_cost = item.labour_cost_cents 
                material_cost = item.material_cost_cents.to_i
                puts "heck"
                puts material_cost
            end
            handling_total = "0.00"
            tax_total = "0.00"
            # puts material_cost
            labour_cost_total = labour_cost * item_count
            materials_cost_total =  materials_cost_total.to_i * item_count
            total_invoice_amt_o = labour_cost_total + materials_cost_total
            cost_total_owner = "CTO+O+" + "+" + labour_cost_total.to_s+ "+" + materials_cost_total.to_s + "+"  + "+" + tax_total.to_s + "+" + total_invoice_amt_o.to_s + "'"
            cost_total_user = "CTO+U+0.00+0.00+0.00+0.00+0.00'"

            total_message_amt = "TMA+" + (total_invoice_amt_o + 0.00).to_s + "'"
            message_trailer = "UNT+" + item_count.to_s + (container.container_uid).to_s
            return interchange, message_header, date_time_ref, references, alternative_curr_amt_std, alternative_curr_amt_dpp, labour_cost, name_addr_receiver,  equipment_details, equipment_related_info, equipment_condition_info, current_usage_info 
        end
        interchange_trailer = "UNZ+" + container_count.to_s + "+I'"
    end
end