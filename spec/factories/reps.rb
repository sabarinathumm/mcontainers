FactoryBot.define do
  factory :rep do
    name { Faker::Measurement.length }
  end
end
