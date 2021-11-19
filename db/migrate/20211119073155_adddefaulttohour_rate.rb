class AdddefaulttohourRate < ActiveRecord::Migration[6.0]
  def change
    change_column :repair_list_items, :mearsk_hours_per_unit, :float, deafult: "0.0"
  end
end
