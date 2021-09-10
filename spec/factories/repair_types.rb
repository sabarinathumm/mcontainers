FactoryBot.define do
  factory :repair_type do
    name { Faker::Measurement.length }
  end
end
