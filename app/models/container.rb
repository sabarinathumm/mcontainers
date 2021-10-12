class Container < ApplicationRecord
    validates_uniqueness_of :container_uid

    belongs_to :customer
    belongs_to :yard
    belongs_to :container_type

    has_many :container_attachments
    has_many :activities

    validates_uniqueness_of :container_uid

    accepts_nested_attributes_for :container_attachments

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

        if Container.where("id < ?", self.id).order(id: :asc).first.present?
            Container.where("id < ?", self.id).order(id: :asc).first.id
        else
            nil
        end
    end

    def position
        Container.all.order(id: :asc).map(&:id).index(id) + 1
    end

end
