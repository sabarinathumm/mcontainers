class AddContainerLengthreferenceToContainers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :activity_items, :container_length,  foreign_key: true
    remove_reference :activity_items, :container_height,  foreign_key: true

    remove_column :containers, :container_length, :float
    remove_column :containers, :container_width, :float

    add_reference :containers, :container_length,  foreign_key: true
    add_reference :containers, :container_height,  foreign_key: true

    add_reference :activity_items, :length,  foreign_key: true
    add_reference :activity_items, :width,  foreign_key: true
  end
end
