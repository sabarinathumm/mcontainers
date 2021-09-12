class AddDeletedAtListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :repair_list_items, :deleted_at, :datetime
  end
end
