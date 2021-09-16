class CreateRepairListItemUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_list_item_uploads do |t|
      t.string :attachment
      t.timestamps
    end
  end
end
