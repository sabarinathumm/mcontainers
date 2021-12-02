class ContainerSerializer < ActiveModel::Serializer
    attributes :id, :container_uid, :container_status, :container_owner_name, :submitter_initials, \
         :manufacture_year, :location, :comments, :container_attachments

    belongs_to :yard, serializer: MetaSerializer
    belongs_to :container_type, serializer: MetaSerializer
    belongs_to :container_length, serializer: MetaSerializer
    belongs_to :container_height, serializer: MetaSerializer
    belongs_to :customer, serializer: CustomerSerializer

    def container_attachments
        JSON.parse(ActiveModel::Serializer::CollectionSerializer.new(object.container_attachments, serializer: ContainerAttachmentSerializer).to_json)
    end
end  