FactoryBot.define do
  factory :repair_mode do
    name { Faker::Measurement.length }
  end
end
