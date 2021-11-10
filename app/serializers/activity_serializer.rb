class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :activity_uid, :container_number, :yard_name, :customer_name, :owner_name, \
        :activity_type, :activity_status, :created_at, :activity_date

    belongs_to :container, serializer: ContainerSerializer
    has_many :activity_timelines, each_serializer: ActivityTimelineSerializer

    def created_at
        object.created_at.strftime("%d-%b-%Y")
    end
end  