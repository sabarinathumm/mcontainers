class ContainerAttachmentSerializer < ActiveModel::Serializer
    attributes :id, :attachment_type, :attachment_url, :attachment_id
end  