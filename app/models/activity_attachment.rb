class ActivityAttachment < ApplicationRecord
    mount_uploader :attachment, ContainerAttachmentUploader

    belongs_to :activity

    enum attachment_type: [:inspection_photo]
end
