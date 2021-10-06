class CreateContainers < ActiveRecord::Migration[6.0]
  def change
    create_table :containers do |t|
      t.string :container_uid
      t.references :yard, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :container_owner_name
      t.string :submitter_initials
      t.float :container_length
      t.float :container_width
      t.references :container_type
      t.integer :manufacture_year
      t.text :location
      t.text :comments

      t.timestamps
    end

    add_index :containers, :container_uid, unique: true
  end
end
