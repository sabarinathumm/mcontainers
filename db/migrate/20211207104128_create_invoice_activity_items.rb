class CreateInvoiceActivityItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_activity_items do |t|
      t.string :repair_code
      t.integer :quantity
      t.string :location
      t.float :hours
      t.integer :labour_cost
      t.integer :material_cost
      t.integer :total_cost
      t.references :container_repair_area
      t.references :container_damaged_area
      t.references :repair_type
      t.references :invoice
      t.timestamps
    end
  end
end
