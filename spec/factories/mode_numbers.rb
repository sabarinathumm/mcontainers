FactoryBot.define do
  factory :mode_number do
    name { Faker::Measurement.length }
  end
end
