class CustomerSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :owner_name, :billing_name, :email, :is_active
end  