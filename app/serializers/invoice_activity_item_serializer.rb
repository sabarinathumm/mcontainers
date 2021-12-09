class InvoiceActivityItemSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :repair_code, :location, :quantity, :hours, :labour_cost, :material_cost, \
      :total_cost
  end