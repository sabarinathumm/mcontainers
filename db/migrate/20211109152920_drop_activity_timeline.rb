class DropActivityTimeline < ActiveRecord::Migration[6.0]
  def up
    drop_table :activity_timelines
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
