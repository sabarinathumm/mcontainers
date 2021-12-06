class Container < ApplicationRecord
    validates_uniqueness_of :container_uid

    belongs_to :customer
    belongs_to :yard
    belongs_to :container_type
    belongs_to :container_length, optional: true
    belongs_to :container_height, optional: true
    has_many :container_attachments
    has_many :activities 
    has_many :activity_items, through: :activities

    validates_uniqueness_of :container_uid
    # validates :location, presence: false, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :create
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :create
    validates :location, presence: false, allow_blank: true, format: { with: /^[DF][BHGTX][1-4X][2-4NX]|[LR][BHGTX][0-9X][02-9XN]|[TUB][LXR][0-9X][02-9XN]|[XEI][X][X][X]$/ , multiline: true }, on: :update
    accepts_nested_attributes_for :container_attachments

    enum container_status: [:idle, :active]

    def container_attachments=(params)
        self.container_attachments_attributes = params
    end

    def location_required?
        false
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


end
