class Activity < ApplicationRecord

    include Filterable
    include Sortable

    belongs_to :container
    belongs_to :assigned_to, polymorphic: true

    enum activity_type: [:quote, :repair]

    enum activity_status: [:quote_draft, :quote_issued, :pending_admin_approval, :pending_customer_approval, :ready_for_repair, \
                            :repair_draft, :repair_done, :repair_pending_admin_approval, :ready_for_billing, :billed , :idle]

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
            where(nil)
        elsif status_params == 'draft'
            where(activity_status: ['quote_draft', 'repair_draft'])
        elsif status_params == 'admin_pending'
            where(activity_status: ['pending_admin_approval', 'repair_pending_admin_approval'])
        elsif status_params == 'customer_pending'
            where(activity_status: 'pending_customer_approval')
        elsif status_params == 'customer_approved'
            where(activity_status: [:ready_for_repair, :repair_draft, :repair_done, :repair_pending_admin_approval, :ready_for_billing, :billed])
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
end
