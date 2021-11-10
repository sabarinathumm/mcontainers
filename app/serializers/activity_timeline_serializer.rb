class ActivityTimelineSerializer < ActiveModel::Serializer
  attributes :id, :history_status, :history_date, :created_at

  def history_date
    object.history_date.strftime("%d-%b-%Y")
  end
end
