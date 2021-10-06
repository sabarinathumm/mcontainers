FactoryBot.define do
  factory :yard do
    name { Faker::Address.city }
    
  end
end
