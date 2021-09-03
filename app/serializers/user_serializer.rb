class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :first_name, :last_name, :phone_number, :full_name
end  