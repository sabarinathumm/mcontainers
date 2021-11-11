class ModifyQuantityinActivityItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :activity_items, :quantity, :integer

    add_column :activity_items, :length, :float
    add_column :activity_items, :width, :float
    add_reference :activity_items, :unit, foreign_key: true
  end
end
