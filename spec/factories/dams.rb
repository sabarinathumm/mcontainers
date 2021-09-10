FactoryBot.define do
  factory :dam do
    name { Faker::Measurement.length }
  end
end
