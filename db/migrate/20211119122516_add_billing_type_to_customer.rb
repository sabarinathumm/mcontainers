class AddBillingTypeToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :billing_type, :integer
    add_column :customers, :approval_type, :integer
  end
end
