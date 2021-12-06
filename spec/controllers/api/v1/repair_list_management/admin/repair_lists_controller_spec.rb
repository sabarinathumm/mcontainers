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
  let!(:length) {create(:length)}
  let!(:width) {create(:width)}
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
            let!(:repair_list){ create(:repair_list, is_active: true) }
            let!(:repair_list_item){ create_list(:repair_list_item, 30, repair_list: repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit, location: 'DBXN') }
            before { post '/api/v1/repair_list_management/admin/repair_list', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    puts json
                    expect(json).not_to be_empty
                    expect(RepairList.where(is_active: true).count).to eql(1)
                    expect(response).to have_http_status(200)
                end
            end
    end
    describe 'Update status of repair_list versions' do
        # valid payload
        context 'success' do
            let!(:repair_list){ create(:repair_list, is_active: true) }
            let!(:valid_attributes){
                {
                    repair_list_id: repair_list.id 
                }
            }
        
            before { put "/api/v1/repair_list_management/admin/repair_list/version_activation/#{repair_list.id}", params: valid_attributes, headers: headers[:auth], as: :json }
        
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                puts json
                #puts repair_list.reload.as_json
                expect(json).not_to be_empty
                # expect(json['repair_lists'].count).to eql(1)
                # expect(json['repair_lists'][0]['id']).to eql(0)
                expect(response).to have_http_status(200)
            end
        end
    end
        
    
end