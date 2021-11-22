class AddDescriptiontoCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :sub_total, :float

    add_column :comps, :material, :string
    add_column :comps, :description, :string

    add_column :dams, :description, :string
  end
end
