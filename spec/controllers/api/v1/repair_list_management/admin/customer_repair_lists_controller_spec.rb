require 'rails_helper'

RSpec.describe 'Admin::CustomerRepairLists::', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:headers) { get_admin_headers(admin) }
  let!(:customer){ create(:customer) }

    describe 'List all Customer Specific Repair Lists' do
    # valid payload
        context 'success' do

        let!(:customer_repair_list){ create(:customer_repair_list, customer: customer) }
        before { get "/api/v1/repair_list_management/admin/customer_repair_list?customer_id=#{customer.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect((json)['customer_repair_lists'].count).to eql(1)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create a new Customer Specific Repair Lists' do
        # valid payload
            context 'success' do
            let!(:customer_repair_lists){ create_list(:customer_repair_list, 10, is_active: true, customer: customer) }
    
            before { post "/api/v1/repair_list_management/admin/customer_repair_list?customer_id=#{customer.id}", headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    #puts json
                    expect(json).not_to be_empty
                    expect(CustomerRepairList.where(is_active: true, customer: customer).count).to eql(1)
                    expect(response).to have_http_status(200)
                end
            end
    end

    describe 'Update status of repair_list versions' do
        # valid payload
        context 'success' do
            let!(:customer){ create(:customer) }
            let!(:customer_repair_lists){ create_list(:customer_repair_list, 10, is_active: true, customer: customer) }
            
        
            before { put "/api/v1/repair_list_management/admin/customer_repair_list/version_activation/#{customer_repair_lists.first.id}", headers: headers[:auth], as: :json }
        
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                #puts repair_list.reload.as_json
                expect(json).not_to be_empty
                # expect(json['customer_repair_lists'].count).to eql(1)
                # expect(json['customer_repair_lists'][0]['id']).to eql(0)
                expect(response).to have_http_status(200)
            end
        end
    end
    
end