class CreateRepairListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_list_items do |t|
      t.references :repair_list, null: false, foreign_key: true
      t.string :uid
      t.references :container_repair_area, null: true, foreign_key: true
      t.references :container_damaged_area, null: true, foreign_key: true
      t.references :repair_type, null: true, foreign_key: true
      t.boolean :is_non_mearsk_not_applicable
      t.float :non_mearsk_hours
      t.money :non_mearsk_material_cost
      t.text :non_mearsk_description
      t.references :comp, null: true, foreign_key: true
      t.references :rep, null: true, foreign_key: true
      t.references :dam, null: true, foreign_key: true
      t.references :component, null: true, foreign_key: true
      t.references :event, null: true, foreign_key: true
      t.text :location
      t.references :unit, null: true, foreign_key: true
      t.float :length
      t.float :width
      t.string :non_mearsk_id_source
      t.boolean :is_mearsk_not_applicable
      t.money :mearsk_max_material_cost
      t.money :mearsk_unit_material_cost
      t.float :mearsk_hours_per_unit
      t.float :mesrsk_max_pieces
      t.float :mearsk_units
      t.references :repair_mode, null: true, foreign_key: true
      t.references :mode_number, null: true, foreign_key: true
      t.string :repair_code
      t.string :combined
      t.string :mearsk_description
      t.string :mearsk_id_source

      t.timestamps
    end

    add_index :repair_list_items, :uid, unique: true
    
  end
end
