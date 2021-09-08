FactoryBot.define do
  factory :admin do
    password { 'Password@123' }
    email { generate(:admin_email) }
    phone_number { generate(:admin_phone_number) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    reset_password_token { nil }
    reset_password_sent_at { nil }
    role { 'administrator' }
    isd_code { generate(:admin_phone_number)}
    is_active { true }
  end

  sequence(:admin_email) do
    email = Faker::Internet.email
    while User.where(email: email).exists?
      email = Faker::Internet.email
    end
    email
  end

  sequence(:admin_phone_number) do
    phone_number = "+91#{Faker::Number.number(digits: 10)}"
    while Admin.where(phone_number: phone_number).exists?
      phone_number = "+91#{Faker::Number.number(digits: 10)}"
    end
    phone_number
  end
    
end

