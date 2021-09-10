FactoryBot.define do
  factory :unit do
    name { Faker::Measurement.length }
  end
end
