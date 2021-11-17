FactoryBot.define do
  factory :width do
    name { Faker::Measurement.length  }
  end
end
