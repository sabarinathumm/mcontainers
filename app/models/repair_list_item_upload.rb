class RepairListItemUpload < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
end
