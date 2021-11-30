FactoryBot.define do
  factory :comp do
    name { Faker::Measurement.length }
    material {"rb"}
  end
end
