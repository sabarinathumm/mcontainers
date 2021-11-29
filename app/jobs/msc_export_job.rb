class MscExportJob < ApplicationJob
    queue_as :default
    puts "MSC"
    def perform(activity_ids) 
           
            container_count = 0
            item_count = 0
            @activities = Activity.where(id: activity_ids)
            puts @activities.to_json
            @containers = Container.where(id: @activities.pluck(:container_id))
            puts @containers.to_json
           
            interchange = "UNB+UNOA:1+CAVANAE:ZZ+MSC:ZZ+" + (Date.today).to_s + (DateTime.now).to_s + "I'"   
            @containers.each do |container|
                puts "Container 1"
                container_count ++
                message_header = "UNH+" + container.container_uid+ "+WESTIM:0++0'"
                puts "Message header"
                puts message_header
                date_time_ref = "DTM+ATR+" + container.created_at.strftime("%d-%b-%Y") + "'"
                references = "RFF+EST+" +  + container.created_at.strftime("%d-%b-%Y") + ":0000'"
                alternative_curr_amt_std = "ACA+CAD+STD:0'"
                alternative_curr_amt_dpp = "ACA+CAD+DPP:0'"
                labour_cost = "LBR+" +  "'"
                name_addr_receiver = "NAD+LED+MSC'" #or "NAD+DED+CAVANAE’"
                equipment_details = "EQF+CON+" + (container.first.container_length).to_s + (container.first.container_type_id).to_s + "'"
                equipment_related_info = "ERI+ST+MAN:01+ACEP'"
                equipment_condition_info = "ECI+D'"
                current_usage_info = "CUI+TRM:CAVANAE:ZZ+TRM:" + container.created_at.strftime("%d-%b-%Y") + "+E'"

                return { interchange: interchange, message_header: message_header, date_time_ref: date_time_ref, references: references, alternative_curr_amt_std: alternative_curr_amt_std, alternative_curr_amt_dpp: alternative_curr_amt_dpp, labour_cost: labour_cost, name_addr_receiver: name_addr_receiver, equipment_details: equipment_details, equipment_related_info: equipment_related_info, equipment_condition_info: equipment_condition_info, current_usage_info: current_usage_info }


                @activity_items = @containers.activity_items.where(id: activity_ids)
                @activity_items.each do |item|
                    item_count ++
                    damage = "DAM+" + "+"+ "line" +"+" + item.location + "+"+ Comp.first.name + Dam.first.name + Comp.first.material + "'"
                    work = "WOR+" + Rep.first.name + "+CMT:100:100:1+1'"
                    cost = "COS+00+" + item.hours+ "+" + item.material_cost_cents+ "+" + "0+" + item.labour_cost_cents+ "+N'"
                    labour_cost = item.labour_cost_cents 
                    material_cost = item.material_cost_cents
                    
                    # handling_total = "0.00"
                    # tax_total = "0.00"
                    # labour_cost_total = #do we need loop here bcz it is total of all or it should outside of item loop
                    # materials_cost =
                    # total_invoice_amt_o = labour_cost_total + materials_cost
                    # cost_total_owner = "CTO+O+" + "+" + labour_cost_total+ "+" + materials_cost + "+" + handling_total + "+" + tax_total + "+" + total_invoice_amt + "'"

                    # cost_total_user = "CTO+U+0.00+0.00+0.00+0.00+0.00'"
            
                    # total_message_amt = "TMA+" + (total_invoice_amt_o + 0.00).to_s + "'"
                end
                handling_total = "0.00"
                tax_total = "0.00"
                labour_cost_total = labour_cost_cents * item_count
                materials_cost_total = material_cost * item_count
                total_invoice_amt_o = labour_cost_total + materials_cost_total
                
                cost_total_owner = "CTO+O+" + "+" + labour_cost_total+ "+" + materials_cost_total + "+" + handling_total + "+" + tax_total + "+" + total_invoice_amt + "'"

                cost_total_user = "CTO+U+0.00+0.00+0.00+0.00+0.00'"
            
                total_message_amt = "TMA+" + (total_invoice_amt_o + 0.00).to_s + "'"
                message_trailer = "UNT+" + item_count.to_s + (container.container_uid).to_s
            end
            interchange_trailer = "UNZ+" + container_count.to_s + "+I'"
            # csv << [ ]
    end
end