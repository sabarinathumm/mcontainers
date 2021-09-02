class ItemSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :created_by
end
  