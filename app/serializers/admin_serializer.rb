class AdminSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :isd_code, :phone_number, :email, :is_active, :display_picture_url, \
        :role
end  