FactoryBot.define do
  factory :user do
    password { 'Password@123' }
    email { generate(:user_email) }
    phone_number { generate(:user_phone_number) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    reset_password_token { nil }
    reset_password_sent_at { nil }
  end

  sequence(:user_email) do
    email = Faker::Internet.email
    while User.where(email: email).exists?
      email = Faker::Internet.email
    end
    email
  end

  sequence(:user_phone_number) do
    phone_number = "+91#{Faker::Number.number(digits: 10)}"
    while User.where(phone_number: phone_number).exists?
      phone_number = "+91#{Faker::Number.number(digits: 10)}"
    end
    phone_number
  end
    
end
