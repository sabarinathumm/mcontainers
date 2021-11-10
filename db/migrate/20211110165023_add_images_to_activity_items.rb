class AddImagesToActivityItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :activity_items, :damaged_area_image, :json
    remove_column :activity_items, :repaired_area_image, :json

    add_reference :activity_items, :damaged_area_image, foreign_key: {to_table: :uploaded_files}
    add_reference :activity_items, :repaired_area_image, foreign_key: {to_table: :uploaded_files}

    add_column :activity_items, :comments, :text
  end
end
