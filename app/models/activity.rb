class Activity < ApplicationRecord

    include Filterable
    include Sortable

    belongs_to :container
    belongs_to :assigned_to, polymorphic: true
    has_many :activity_timelines
    has_many :activity_items

    before_update :set_activity_timeline
    after_create :set_activity_uid
    before_update :set_container_status
    
    enum activity_type: [:quote, :repair]

    enum activity_status: [:quote_draft, :pending_admin_approval, :pending_customer_approval, :ready_for_repair, \
    :repair_draft, :repair_pending_admin_approval, :ready_for_billing, :billed , :idle, :deleted]

    def self.search_by(uid)
        if uid.blank?
            where(nil)
        else
            joins(:container).where("containers.container_uid LIKE CONCAT('%',?,'%')", uid)
        end
    end

    def self.filter_by_date(date_params)
        date = date_params.to_date
        where(created_at: date.midnight..date.end_of_day)
    end

    def self.filter_by_activity_status(activity_status_params)
        where(activity_status: activity_status_params)
    end

    def self.filter_by_activity_type(activity_type_params)
        where(activity_type: activity_type_params)
    end

    def self.filter_by_yard_id(yard_id_params)
        joins(:container).where("containers.yard_id = ?",yard_id_params)
    end

    def self.filter_by_customer_id(customer_id_params)
        joins(:container).where("containers.customer_id = ?",customer_id_params)
    end

    def self.filter_by_status(status_params)
        if status_params == 'all'
            where.not(activity_status: 'repair_pending_admin_approval')
        elsif status_params == 'draft'
            where(activity_status: ['quote_draft', 'repair_draft'])
        elsif status_params == 'admin_pending'
            where(activity_status: ['pending_admin_approval', 'repair_pending_admin_approval'])
        elsif status_params == 'customer_pending'
            where(activity_status: 'pending_customer_approval')
        elsif status_params == 'customer_approved'
            where(activity_status: 'ready_for_repair')
        end
    end

    def self.sort_by_yard_name(yard_name_params)
        if yard_name_params.to_i == 1
            joins(container: :yard).order("yards.name ASC")
        elsif yard_name_params.to_i == -1
            joins(container: :yard).order("yards.name DESC")
        else
            where(nil)
        end
    end

    def self.sort_by_owner_name(owner_name_params)
        if owner_name_params.to_i == 1
            joins(:container).order("containers.container_owner_name ASC")
        elsif owner_name_params.to_i == -1
            joins(:container).order("containers.container_owner_name DESC")
        else
            where(nil)
        end
    end

    def self.sort_by_activity_status_sort(activity_status_params)
        if activity_status_params.to_i == 1
            order(activity_status: :asc)
        elsif activity_status_params.to_i == -1
            order(activity_status: :desc)
        else
            where(nil)
        end      
    end

    def self.sort_by_activity_type_sort(activity_type_params)
        if activity_type_params.to_i == 1
            order(activity_type: :asc)
        elsif activity_type_params.to_i == -1
            order(activity_type: :desc)
        else
            where(nil)
        end        
    end

    def self.sort_by_activity_uid_sort(activity_uid_params)
        if activity_uid_params.to_i == 1
            order(activity_uid: :asc)
        elsif activity_uid_params.to_i == -1
            order(activity_uid: :desc)
        else
            where(nil)
        end        
    end

    def self.sort_by_customer_name(customer_name_params)
        if customer_name_params.to_i == 1
            joins(container: :customer).order("customers.full_name ASC")
        elsif customer_name_params.to_i == -1
            joins(container: :customer).order("customers.full_name DESC")
        else
            where(nil)
        end
    end

    def self.sort_by_created_at(created_at_params)
        if created_at_params.to_i == 1
            order(created_at: :asc)
        elsif created_at_params.to_i == -1
            order(created_at: :desc)
        else
            where(nil)
        end
    end

    def sub_total
        @activity_items = self.activity_items
        @total_cost_cents = @activity_items.pluck(:total_cost_cents)
        return @total_cost_cents.sum/100
    end
    
    def container_number
        self.container.container_uid
    end

    def yard_name
        self.container.yard.name
    end

    def customer_name
        self.container.customer.full_name
    end

    def owner_name
        self.container.container_owner_name
    end

    def self.export(options = {})
        CSV.generate(options) do |csv|
          csv << %w{uid activity_status activity_type container_number yard_name customer_name owner_name}
          all.each do |activity|
            csv << [ activity.activity_uid, activity.activity_status, activity.activity_type, activity.container_number , activity.yard_name , activity.customer_name , activity.owner_name]
          end
        end
    end

    # def self.msc_export(options = {})
    #     CSV.generate(options) do |csv|
        
    #       all.each do |activity|
    #         interchange = "UNB+UNOA:1+CAVANAE:ZZ+MSC:ZZ+" + (Container.created_at.day+Container.created_at.month+Container.created_at.year).to_s + "+" + Container.created_at.time + "I'"
    #         message_header = "UNH+" + + "+WESTIM:0++0'"
    #         date_time_ref = "DTM+ATR+" + (RepairListItem.created_at.day+RepairListItem.created_at.month+RepairListItem.created_at.year).to_s + "'"
    #         references = "RFF+EST+" +  + (RepairListItem.created_at.day+RepairListItem.created_at.month+RepairListItem.created_at.year).to_s + ":0000'"
    #         alternative_curr_amt_std = "ACA+CAD+STD:0'"
    #         alternative_curr_amt_dpp = "ACA+CAD+DPP:0'"
    #         labour_cost = "LBR+" +   + "'"
    #         name_addr_receiver = "NAD+LED+MSC'" #or "NAD+DED+CAVANAE’"
    #         equipment_details = "EQF+CON+" + + +  (Container.first.container_length).to_s + (Container.first.container_type_id).to_s +"'"
    #         equipment_related_info = "ERI+ST+MAN:01+ACEP'"
    #         equipment_condition_info = "ECI+D'"
    #         current_usage_info = "CUI+TRM:CAVANAE:ZZ+TRM:" + (RepairListItem.created_at.day+RepairListItem.created_at.month+RepairListItem.created_at.year).to_s + "+E'"
    #         damage = "DAM+" + "+"+ +"+"+ "+"+ Comp.first.name + Dam.first.name + Com.first.material +"'"
            # work = "WOR+" + + "+CMT:100:100:1+1'"
            # cost = "COS+00+" + + "+" + + "+" + "0+" + + "+N'"

            # handling_total = "0.00"
            # tax_total = "0.00"
            # labour_cost_total = 
            # materials_cost =
            # total_invoice_amt = labour_cost_total + materials_cost
            # cost_total_owner = "CTO+O+" + "+" + labour_cost_total+ "+" + materials_cost + "+" + handling_total + "+" + tax_total + "+" + total_invoice_amt +"'"

            # handling_total = "0.00"
            # tax_total = "0.00"
            # labour_cost_total = 
            # materials_cost =
    #         total_invoice_amt = labour_cost_total + materials_cost
    #         cost_total_user = "CTU+0+" + "+" + labour_cost_total+ "+" + materials_cost + "+" + handling_total + "+" + tax_total + "+" + total_invoice_amt +"'"

    #         total_message_amt = "TMA+" + (cost_total_owner + cost_total_user).to_s +"'"
    #         message_trailer = "UNT+" +
    #         interchange_trailer = "UNZ+" + "something" + "+I'"
    #         csv << [ ]
    #       end
    #     end
    # end

    # def self.maersk_export(options = {})
    #     # puts "hi"
    #     CSV.generate(options) do |csv|
    #         all.each do |activity_items|
    #             msg_header = "CTL"
    #             shop_code = "C50"
    #             generated_indentifer = "000000"
    #             message_header = msg_header + shop_code + generated_indentifer
    #             # puts message_header

    #             # Header 1
    #             customer_code = "MAER"
    #             shop_code = "C50"
    #             repair_date = self.container.first.created_at.day.to_s + Container.first.created_at.month.to_s + Container.first.created_at.year.to_s
    #             # strftime("%d-%b-%Y")
    #             puts repair_date
    #             equipment_number = self.container.first.container_uid
    #             mode = "0" + self.container.first.container_type_id.to_s
    #             cause = "1"
    #             third_party_location = "   "
    #             wo_type = "E"
    #             header_one = "HD1" + customer_code + shop_code + repair_date.to_s + equipment_number.to_s + mode.to_s + cause + third_party_location + wo_type

    #             # ‘HD2[VendorReferenceNumber][StraightTime][OverTime][DoubleTime][MiscTime][TotalAmount][Space-13]
    #             vendor_ref_number = "                          " + "0000010915"
    #             hours_per_unit = CustomerRepairListItem.first.mearsk_hours_per_unit.to_i
    #             units = CustomerRepairListItem.first.mearsk_units.to_i
    #             straight_time = hours_per_unit * units
    #             over_time = "0000"
    #             double_time = "0000"
    #             misc_time = "0000"
    #             total_amount = "total_amt"
    #             space_13 = "             "
    #             header_two = "HD2" + vendor_ref_number + straight_time.to_s + over_time + double_time + misc_time + total_amount + space_13

    #             # repair_items
    #             damage_code = Dam.first.name
    #             repair_code = RepairListItem.first.uid
    #             repair_loc_code = Container.first.location
    #             piece_count = CustomerRepairListItem.first.mearsk_units
    #             material_amount = CustomerRepairListItem.first.mearsk_max_material_cost_cents/100
    #             man_hours = CustomerRepairListItem.first.mearsk_hours_per_unit
    #             third_party_indicator = 'O'
    #             repair_item = "RPR" + damage_code + "  " + repair_code + repair_loc_code + piece_count.to_s + material_amount.to_s + man_hours.to_s + third_party_indicator 

    #             csv << [ message_header, header_one, header_two, repair_item ]
    #         end
    #     end
    # end

    def set_activity_timeline
        if self.activity_status_was.present? && self.activity_status != self.activity_status_was
            self.activity_timelines.create!(history_status: self.activity_status, history_date: Date.today)
        end
    end

    def set_customer_repair_list
        @customer_repair_list_items = CustomerRepairListItems.find_by[:id]
    end

    def set_activity_uid
            if self.activity_type == "quote"
                uid = 'QF'+rand(11111..99999).to_s
                if self.activity_uid == uid
                    uid = 'RF' + rand(11111..99999).to_s
                end
            elsif self.activity_type == "repair"
                uid = 'RF'+rand(11111..99999).to_s
                if self.activity_uid == uid
                    uid = 'RF' + rand(11111..99999).to_s
                end
            end
        self.activity_uid = uid
        self.save!
    end

    def set_container_status
        if self.activity_status_was != self.activity_status && self.activity_status_was.present? && self.activity_status=='ready_for_billing' || self.activity_status=='billed' || self.activity_status=='idle' || self.activity_status=='deleted'
            if self.container.activities.present?
                status = true
                self.container.activities.each do |activity|
                    unless activity.activity_status == 'idle' || activity.activity_status == 'ready_for_billing' || activity.activity_status == 'deleted' || activity.activity_status == 'billed'
                        status = false
                        break
                    end
                end
                self.container.update!(container_status: 'idle') if status == true
            end
        end
    end
end
