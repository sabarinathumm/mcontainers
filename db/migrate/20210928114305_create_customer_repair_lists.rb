class CreateCustomerRepairLists < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_repair_lists do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
