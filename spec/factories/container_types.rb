FactoryBot.define do
  factory :container_type do
    name { Faker::Measurement.length }
    
  end
end
