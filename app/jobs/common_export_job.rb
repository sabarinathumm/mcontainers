class CommonExportJob < ApplicationJob
    queue_as :default
    puts "Common"

    def perform(activity_ids)

        @activities = Activity.where(id: activity_ids)
        @containers = Container.where(id: @activities.pluck(:container_id))
        msg_header = "CTL"
        shop_code = "C50"
        generated_indentifer = "000000"
        message_header = msg_header + shop_code + generated_indentifer
        container_blocks = []

        @containers.each do |container|
            customer_code = "MAER"
            repair_date = container.created_at.strftime("%d-%b-%Y")
            equipment_number = container.container_uid
            mode = "0" + container.container_type_id.to_s
            cause = "1"
            third_party_location = "   "
            wo_type = "E"

            header_one = "HD1" + customer_code + shop_code + repair_date.to_s + equipment_number.to_s + mode.to_s + cause + third_party_location + wo_type
            container_blocks << header_one
            @activity_items = container.activity_items.where(activity_id:  activity_ids )
            throw_error('No repair items assigned to export', :unprocessable_entity) if @activity_items.blank?

            # ‘HD2[VendorReferenceNumber][StraightTime][OverTime][DoubleTime][MiscTime][TotalAmount][Space-13]
            vendor_ref_number = "                          " + "0000010915"
            hours_per_unit = @activity_items.pluck(:hours)
            # units = @activity_items.count
            straight_time = hours_per_unit.sum
            over_time = "0000"
            double_time = "0000"
            misc_time = "0000"

            total_amount = (straight_time  + (@activity_items.first.material_cost_cents/100))
            space_13 = "             "
            header_two = "HD2" + vendor_ref_number + straight_time.to_s + over_time + double_time + misc_time + total_amount.to_s + space_13
            container_blocks << header_two
            @activity_items.each do |item|
                # repair_items
                damage_code = Dam.first.name
                repair_code = item.repair_code
                repair_loc_code = item.location
                # piece_count = item.mearsk_units
                material_amount = item.material_cost_cents/100
                man_hours = item.hours
                third_party_indicator = 'O'
                repair_item_line = "RPR" + damage_code + "  " + repair_code + repair_loc_code + material_amount.to_s + man_hours.to_s + third_party_indicator 
                # + piece_count.to_s +
                # puts repair_item
                container_blocks << repair_item_line
            end
        end
        return message_header, container_blocks
    end 
end