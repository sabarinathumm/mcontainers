class Container < ApplicationRecord
    validates_uniqueness_of :container_uid

    belongs_to :customer
    belongs_to :yard
    belongs_to :container_type

    has_many :container_attachments

    validates_uniqueness_of :container_uid

    accepts_nested_attributes_for :container_attachments

    def container_attachments=(params)
        self.container_attachments_attributes = params
    end
end
