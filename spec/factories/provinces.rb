FactoryBot.define do
  factory :province do
    name { Faker::Nation.nationality }
    
  end
end
