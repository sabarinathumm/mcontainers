FactoryBot.define do
  factory :container do
    container_uid {generate(:container_uid)}
    container_owner_name { Faker::Name.name_with_middle }
    submitter_initials { Faker::Name.initials }
    container_length { 15.0 }
    container_width { 15.0 }
    manufacture_year { 2019 }
    location { "Local Grounds" }
    comments { "Comments" }
    
  end
  sequence(:container_uid) do
    container_uid = Faker::Number.number(digits: 7)
    while Container.where(container_uid: container_uid).exists?
      container_uid = Faker::Number.number(digits: 7)
    end
    container_uid
  end
end
