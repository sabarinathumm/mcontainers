class ActivityTimelineSerializer < ActiveModel::Serializer
  attributes :id, :history_status, :history_date, :created_at
end
