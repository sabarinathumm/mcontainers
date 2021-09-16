class RepairListSerializer < ActiveModel::Serializer
    attributes :id, :name, :is_active, :created_at

    def name
        object.name+' '+object.created_at.strftime("%d-%b-%Y")
    end
end