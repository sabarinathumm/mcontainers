class Activity < ApplicationRecord

    include Filterable

    belongs_to :container
    belongs_to :assigned_to, polymorphic: true

    enum activity_type: [:quote, :repair]

    enum activity_status: [:quote_draft, :issued, :pending_admin_approval, :pending_customer_approval, :ready_for_repair, \
                            :repair_draft, :repair_done, :repair_pending_admin_approval, :ready_for_billing, :billed ]

    def self.search_by(uid)
        if uid.nil?
            where(nil)
        else
            joins(:container).where("container.container_uid LIKE ?", uid)
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
        statuses = [:draft]
        where(activity_status: activity_status_params)
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
end
