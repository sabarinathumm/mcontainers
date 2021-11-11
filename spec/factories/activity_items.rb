FactoryBot.define do
  factory :activity_item do

    repair_code { '4150' }
    length { 50.0 }
    width { 50.0 }
    location { 'Anna Nagar' }  
    hours { 55.0 }  
    comments { 'Random Comments' }  
    
  end
end
