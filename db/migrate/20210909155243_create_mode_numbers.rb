class CreateModeNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :mode_numbers do |t|
      t.string :name

      t.timestamps
    end
  end
end
