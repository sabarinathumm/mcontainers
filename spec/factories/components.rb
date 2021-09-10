FactoryBot.define do
  factory :component do
    name { Faker::Measurement.length }
    
  end
end
