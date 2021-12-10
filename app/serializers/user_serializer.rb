class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :full_name, :user_type

    def user_type
        object.class.name
    end
end  