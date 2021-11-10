class CreateActivityTimelines < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_timelines do |t|
      t.integer :history_status
      t.datetime :history_date
      t.references :activities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
