class CreateContainerLengths < ActiveRecord::Migration[6.0]
  def change
    create_table :container_lengths do |t|
      t.string :name

      t.timestamps
    end
  end
end
