class AddSubTotalToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :sub_total, :float
  end
end
