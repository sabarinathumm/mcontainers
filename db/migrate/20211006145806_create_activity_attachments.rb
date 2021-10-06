class CreateActivityAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_attachments do |t|
      t.references :activity, null: false
      t.integer :attachment_type
      t.json :attachment

      t.timestamps
    end
  end
end
