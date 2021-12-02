FactoryBot.define do
  factory :container_length do
    name { Faker::Measurement.length }
  end
end
