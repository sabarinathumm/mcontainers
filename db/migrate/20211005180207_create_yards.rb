class CreateYards < ActiveRecord::Migration[6.0]
  def change
    create_table :yards do |t|
      t.string :name

      t.timestamps
    end
  end
end
