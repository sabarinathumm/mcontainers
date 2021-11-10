class AddActivityforeignTotimeline < ActiveRecord::Migration[6.0]
  def change
    remove_column :activity_timelines, :activities_id
    add_reference :activity_timelines, :activity, null: false, foreign_key: true 
  end
end
