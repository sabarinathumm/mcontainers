FactoryBot.define do
  factory :activity do
    activity_type { 'quote' }
    activity_status { 'quote_draft' }
    inspection_comment { 'No Comments Simply Waste' }   
  end
end
