FactoryBot.define do
  factory :event do
    name { Faker::Measurement.length }
  end
end
