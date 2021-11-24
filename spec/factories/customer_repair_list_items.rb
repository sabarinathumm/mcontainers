FactoryBot.define do
  factory :customer_repair_list_item do  
    uid { generate(:cus_uid)}
    location {'DBXN'}
  end

  sequence(:cus_uid) do
    cus_uid = Faker::Number.number(digits: 4)
    while CustomerRepairListItem.where(uid: cus_uid).exists?
      cus_uid = Faker::Number.number(digits: 4)
    end
    cus_uid
  end
end
