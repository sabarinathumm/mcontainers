class CreateContainerDamagedAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :container_damaged_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
