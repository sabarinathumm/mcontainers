class AddUploadedFileIdtoContainerAttachments < ActiveRecord::Migration[6.0]
  def change
    remove_column :container_attachments, :attachment

    add_reference :container_attachments, :attachment, null: false, foreign_key: { to_table: :uploaded_files }
  end
end
