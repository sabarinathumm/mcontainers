FactoryBot.define do
  factory :length do
    name { Faker::Measurement.length  }
  end
end
