class AddActivityDatetoActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :activity_date, :datetime
  end
end
