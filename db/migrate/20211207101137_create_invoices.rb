class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.integer :status
      t.timestamps
    end
  end
end
