class CreateUploadedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_files do |t|
      t.string :attachment
      t.references :user, polymorphic: true, null: false

      t.timestamps
    end
  end
end
