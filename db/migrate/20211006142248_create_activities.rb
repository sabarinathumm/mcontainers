class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :container, null: false
      t.string :activity_uid
      t.integer :activity_type
      t.integer :activity_status
      t.references :assigned_to, polymorphic: true
      t.text :inspection_comment

      t.timestamps
    end
  end
end
