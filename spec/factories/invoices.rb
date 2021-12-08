FactoryBot.define do
  factory :invoice do
    invoice_number { "MyString" }
    status { 1 }
    # activity_id { "" }
  end
end
