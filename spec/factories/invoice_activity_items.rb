FactoryBot.define do
  factory :invoice_activity_item do
    repair_code { "MyString" }
    quantity { "" }
    location { "MyString" }
    hours { 1.5 }
    labour_cost { 1 }
    material_cost { 1 }
    total_cost { 1 }
  end
end
