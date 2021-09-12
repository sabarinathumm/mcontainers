require 'rails_helper'

RSpec.describe 'RepairLists::', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:headers) { get_admin_headers(admin) }
  let!(:repair_type){ create(:repair_type) }
  let!(:container_damaged_area){ create(:container_damaged_area) }
  let!(:container_repair_area){ create(:container_repair_area) }
  let!(:component){ create(:component) }
  let!(:comp){ create(:comp) }
  let!(:rep){ create(:rep) }
  let!(:dam){ create(:dam) }
  let!(:mode_number){ create(:mode_number) }
  let!(:repair_mode){ create(:repair_mode) }
  let!(:event){ create(:event) }
  let!(:unit){ create(:unit) }

    describe 'List all Repair Lists' do
    # valid payload
        context 'success' do

        let!(:repair_list){ create(:repair_list) }
        before { get '/api/v1/repair_list_management/admin/repair_list', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect((json)['repair_lists'].count).to eql(1)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create Repair Lists' do
        # valid payload
            context 'success' do
            let!(:repair_lists){ create_list(:repair_list, 10, is_active: true) }
    
            before { post '/api/v1/repair_list_management/admin/repair_list', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    #puts json
                    expect(json).not_to be_empty
                    expect(RepairList.where(is_active: true).count).to eql(1)
                    expect(response).to have_http_status(200)
                end
            end
        end
    
end