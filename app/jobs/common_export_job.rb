class CommonExportJob < ApplicationJob
    queue_as :default
    puts "Common"
    def perform (activity_ids)
        @activities = Activity.where(id: activity_ids)
        @containers = Container.where(id: @activities.pluck(:container_id))
        msg_header = "CTL"
        shop_code = "C50"
        generated_indentifer = "000000"
        message_header = msg_header + shop_code + generated_indentifer
        @containers.each do |container| 
            customer_code = "MAER"
            repair_date = container.created_at.strftime("%d-%b-%Y")
            equipment_number = container.container_uid
            mode = "0" + container.container_type_id.to_s
            cause = "1"
            third_party_location = "   "
            wo_type = "E"
            header_one = "HD1" + customer_code + shop_code + repair_date.to_s + equipment_number.to_s + mode.to_s + cause + third_party_location + wo_type
            
            # return {message_header: message_header, header_one: header_one}
            
            @activity_items = container.activity_items.where(id: activity_ids)
            puts activity_ids
            puts "Activity items"
            puts @activity_items.to_json
            @activity_items.each do |item|
                puts "Message"
                # ‘HD2[VendorReferenceNumber][StraightTime][OverTime][DoubleTime][MiscTime][TotalAmount][Space-13]
                vendor_ref_number = "                          " + "0000010915"
                hours_per_unit = item.hours.to_i
                units = item.count
                straight_time = hours_per_unit * units
                over_time = "0000"
                double_time = "0000"
                misc_time = "0000"
                total_amount = (straight_time * (item.customer.first.hourly_rate_cents/100)) + (item.material_cost_cents/100)
                space_13 = "             "
                header_two = "HD2" + vendor_ref_number + straight_time.to_s + over_time + double_time + misc_time + total_amount.to_s + space_13

                # repair_items
                damage_code = Dam.first.name
                repair_code = item.first.repair_code
                repair_loc_code = item.first.location
                piece_count = CustomerRepairListItem.first.mearsk_units
                material_amount = item.material_cost_cents/100
                man_hours = item.hours
                third_party_indicator = 'O'
                repair_item = "RPR" + damage_code + "  " + repair_code + repair_loc_code + piece_count.to_s + material_amount.to_s + man_hours.to_s + third_party_indicator 
  
                return {header_two: header_two, repair_item: repair_item} 
            end



        end
    end

end