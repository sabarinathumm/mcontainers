FactoryBot.define do
  factory :repair_list_item do
    uid { generate(:uid)}
  end

  sequence(:uid) do
    uid = Faker::Number.number(digits: 4)
    while RepairListItem.where(uid: uid).exists?
      uid = Faker::Number.number(digits: 4)
    end
    uid
  end
end
