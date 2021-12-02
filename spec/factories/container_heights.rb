FactoryBot.define do
  factory :container_height do
    name { Faker::Measurement.length }
  end
end
