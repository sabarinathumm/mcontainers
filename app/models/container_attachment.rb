class ContainerAttachment < ApplicationRecord
    mount_uploader :attachment, ContainerAttachmentUploader
    belongs_to :container

    enum attachment_type: [:left_side_photo, :right_side_photo, :door_photo, :front_side_photo, \
        :interior_photo, :underside_photo, :roof_photo, :csc_plate_number]

    validates_presence_of :attachment

    def attachment_url
        self.attachment.file.authenticated_url if self.attachment.present?
    end
end
