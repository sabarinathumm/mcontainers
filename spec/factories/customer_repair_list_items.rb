FactoryBot.define do
  factory :customer_repair_list_item do  
    uid { generate(:cus_uid)}
  end

  sequence(:cus_uid) do
    uid = Faker::Number.number(digits: 4)
    while RepairListItem.where(uid: uid).exists?
      uid = Faker::Number.number(digits: 4)
    end
    uid
  end
end
