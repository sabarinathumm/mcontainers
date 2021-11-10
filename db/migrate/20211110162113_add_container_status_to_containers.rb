class AddContainerStatusToContainers < ActiveRecord::Migration[6.0]
  def change
    add_column :containers, :container_status, :integer, default: 0
  end
end
