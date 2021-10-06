class CreateContainerAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :container_attachments do |t|
      t.references :container, null: false, foreign_key: true
      t.json :attachment
      t.integer :attachment_type

      t.timestamps
    end
  end
end
