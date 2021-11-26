class Container < ApplicationRecord
    validates_uniqueness_of :container_uid

    belongs_to :customer
    belongs_to :yard
    belongs_to :container_type

    has_many :container_attachments
    has_many :activities 
    has_many :activity_items, through: :activity

    validates_uniqueness_of :container_uid
    validates :location, presence: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :create

    accepts_nested_attributes_for :container_attachments

    enum container_status: [:idle, :active]

    def container_attachments=(params)
        self.container_attachments_attributes = params
    end

    def next_id

        if Container.where("id > ?", self.id).order(id: :asc).first.present?
            Container.where("id > ?", self.id).order(id: :asc).first.id
        else
            nil
        end
    end
    
    def prev_id

        if Container.where("id < ?", self.id).order(id: :asc).last.present?
            Container.where("id < ?", self.id).order(id: :asc).last.id
        else
            nil
        end
    end

    def position
        Container.all.order(id: :asc).map(&:id).index(id) + 1
    end

    # def self.msc_export(options = {})
    #     CSV.generate(options) do |csv|
    #       csv << %w{uid activity_status activity_type container_number yard_name customer_name owner_name}
    #       all.each do |activity|
    #         csv << [ activity.activity_uid, activity.activity_status, activity.activity_type, activity.container_number , activity.yard_name , activity.customer_name , activity.owner_name]
    #       end
    #     end
    # end

    # def self.common_export(options = {})
    #     CSV.generate(options) do |csv|
    #       csv << %w{uid activity_status activity_type container_number yard_name customer_name owner_name}
    #       all.each do |activity|
    #         csv << [ activity.activity_uid, activity.activity_status, activity.activity_type, activity.container_number , activity.yard_name , activity.customer_name , activity.owner_name]
    #       end
    #     end
    # end

end
