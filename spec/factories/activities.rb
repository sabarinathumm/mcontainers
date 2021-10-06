FactoryBot.define do
  factory :activity do
    activity_uid {generate(:activity_uid)}
    activity_type { 'quote' }
    activity_status { 'pending' }
    inspection_comment { 'No Comments Simply Waste' }   
  end
  sequence(:activity_uid) do
    activity_uid = Faker::Number.number(digits: 10)
    while Activity.where(activity_uid: activity_uid).exists?
      activity_uid = Faker::Number.number(digits: 10)
    end
    activity_uid
  end
end
