FactoryBot.define do
  factory :customer do
    password { 'Password@123' }
    email { generate(:customer_email) }
    full_name { Faker::Name.first_name }
    owner_name { Faker::Name.first_name }
    billing_name { Faker::Name.first_name }
    gst { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    pst { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    address { Faker::Address.street_address }
    zipcode { Faker::Address.zip_code }
    customer_type { 'mearsk' }
    reset_password_token { nil }
    reset_password_sent_at { nil }
    is_active { true }
  end

  sequence(:customer_email) do
    email = Faker::Internet.email
    while Customer.where(email: email).exists?
      email = Faker::Internet.email
    end
    email
  end
    
end
