class AddContainerLengthreferenceToActivityItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :activity_items, :length,  foreign_key: true
    remove_reference :activity_items, :width,  foreign_key: true

    add_reference :activity_items, :container_length,  foreign_key: true
    add_reference :activity_items, :container_height,  foreign_key: true
  end
end
