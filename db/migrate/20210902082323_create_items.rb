class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :created_by
      t.string :description

      t.timestamps
    end
  end
end
