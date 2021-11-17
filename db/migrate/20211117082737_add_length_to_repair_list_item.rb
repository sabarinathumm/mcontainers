class AddLengthToRepairListItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :repair_list_items, :length, :float
    remove_column :repair_list_items, :width, :float

    remove_column :activity_items, :length, :float
    remove_column :activity_items, :width, :float


    remove_column :customer_repair_list_items, :length, :float
    remove_column :customer_repair_list_items, :width, :float

    add_reference :repair_list_items, :length, foreign_key: true
    add_reference :repair_list_items, :width,  foreign_key: true

    add_reference :customer_repair_list_items, :width,  foreign_key: true
    add_reference :customer_repair_list_items, :length,  foreign_key: true

    add_reference :activity_items, :length,  foreign_key: true
    add_reference :activity_items, :width,  foreign_key: true


  end
end
