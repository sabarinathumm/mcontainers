FactoryBot.define do
  factory :comp do
    name { Faker::Measurement.length }
    
  end
end
