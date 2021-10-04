require 'rails_helper'

RSpec.describe 'Shared::RepairLists', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:headers) { get_admin_headers(admin) }
  let!(:repair_list){ create(:repair_list, is_active: true) }
  let!(:customer){ create(:customer) }
  let!(:customer2){ create(:customer) }
  let!(:customer_repair_list){ create(:customer_repair_list, customer: customer, is_active: true) }
  let!(:customer_repair_list2){ create(:customer_repair_list, customer: customer2, is_active: true) }

    describe 'List all Active Customer Repair Lists along with the default Active Repair List' do
    # valid payload
        context 'success' do

        
        before { get '/api/v1/repair_list_management/shared/all_customer_lists', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                #puts repair_list.reload.as_json
                expect(json).not_to be_empty
                expect(json['customer_repair_lists'].count).to eql(3)
                expect(response).to have_http_status(200)
            end
        end
    end
    
end