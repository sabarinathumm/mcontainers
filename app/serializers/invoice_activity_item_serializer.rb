class InvoiceActivityItemSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :repair_code, :location, :quantity, :hours, :labour_cost, :material_cost, \
  :total_cost


  belongs_to :container_repair_area, serializer: MetaSerializer
  belongs_to :container_damaged_area, serializer: MetaSerializer
  belongs_to :repair_type, serializer: MetaSerializer
end