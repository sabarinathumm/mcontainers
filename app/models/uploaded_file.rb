class UploadedFile < ApplicationRecord
    mount_uploader :attachment, ContainerAttachmentUploader
    belongs_to :user, polymorphic: true

    def attachment_url
        self.attachment.file.authenticated_url if self.attachment.present?
    end
end
