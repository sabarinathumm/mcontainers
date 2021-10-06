class CreateActivityItems < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_items do |t|
      t.references :activity, null: false
      t.string :repair_code
      t.references :container_repair_area
      t.references :container_damaged_area
      t.references :repair_type
      t.integer :quantity
      t.text :location
      t.float :hours
      t.monetize :labour_cost
      t.monetize :material_cost
      t.monetize :total_cost
      t.json :damaged_area_image
      t.json :repaired_area_image

      t.timestamps
    end
  end
end
