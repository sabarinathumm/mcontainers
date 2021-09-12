class CreateRepairLists < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_lists do |t|
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
