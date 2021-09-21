class ModifyUidIndexOnRepairListItems < ActiveRecord::Migration[6.0]
  def change
    remove_index :repair_list_items, :uid
    add_index :repair_list_items, [:uid, :repair_list_id], unique: true
  end
end
