require 'rails_helper'

RSpec.describe 'RepairListItems::', type: :request do
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
  let!(:repair_list){ create(:repair_list) }
  

    describe 'List all Repair List items of a List' do
    # valid payload
        context 'success' do
            
            let!(:repair_list_item){ create_list(:repair_list_item, 30, repair_list: repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            let!(:repair_list_item2){ create(:repair_list_item, repair_list: repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit, deleted_at: DateTime.now) }

            before { get "/api/v1/repair_list_management/admin/repair_list/#{repair_list.id}/items", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['repair_list_items'].count).to eql(20)
                expect(json['repair_list_items'][0]['repair_type']['name']).to eql(repair_type.name)
                expect(json['repair_list_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['repair_list_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['repair_list_items'][0]['component']['name']).to eql(component.name)
                expect(json['repair_list_items'][0]['comp']['name']).to eql(comp.name)
                expect(json['repair_list_items'][0]['dam']['name']).to eql(dam.name)
                expect(json['repair_list_items'][0]['rep']['name']).to eql(rep.name)
                expect(json['repair_list_items'][0]['mode_number']['name']).to eql(mode_number.name)
                expect(json['repair_list_items'][0]['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['repair_list_items'][0]['event']['name']).to eql(event.name)
                expect(json['repair_list_items'][0]['unit']['name']).to eql(unit.name)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create Repair List items of a List' do
    # valid payload
        context 'success' do
            
            let!(:valid_attributes){ 
                {
                    repair_list_item: { repair_type_id: repair_type.id, \
                container_damaged_area_id: container_damaged_area.id, container_repair_area_id: container_repair_area.id, \
                component_id: component.id, comp_id: comp.id, dam_id: dam.id, rep_id: rep.id, mode_number_id: mode_number.id, \
                repair_mode_id: repair_mode.id, event_id: event.id, unit_id: unit.id}
                    }
            }

            before { post "/api/v1/repair_list_management/admin/repair_list/#{repair_list.id}/items", params: valid_attributes, headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['repair_list_item']['component']['name']).to eql(component.name)
                expect(json['repair_list_item']['comp']['name']).to eql(comp.name)
                expect(json['repair_list_item']['dam']['name']).to eql(dam.name)
                expect(json['repair_list_item']['rep']['name']).to eql(rep.name)
                expect(json['repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                expect(json['repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['repair_list_item']['event']['name']).to eql(event.name)
                expect(json['repair_list_item']['unit']['name']).to eql(unit.name)
                expect(json['repair_list_item']['deleted_at']).to eql(nil)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Show Repair List item' do
    # valid payload
        context 'success' do

            let!(:repair_list_item){ create(:repair_list_item, repair_list: repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            before { get "/api/v1/repair_list_management/admin/repair_list/items/#{repair_list_item.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['repair_list_item']['component']['name']).to eql(component.name)
                expect(json['repair_list_item']['comp']['name']).to eql(comp.name)
                expect(json['repair_list_item']['dam']['name']).to eql(dam.name)
                expect(json['repair_list_item']['rep']['name']).to eql(rep.name)
                expect(json['repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                expect(json['repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['repair_list_item']['event']['name']).to eql(event.name)
                expect(json['repair_list_item']['unit']['name']).to eql(unit.name)
                expect(json['repair_list_item']['deleted_at']).to eql(nil)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Soft Delete Repair List item' do
        # valid payload
            context 'success' do
    
                let!(:repair_list_item){ create(:repair_list_item, repair_list: repair_list, repair_type: repair_type, \
                    container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                    component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                    event: event, unit: unit) }
    
                before { delete "/api/v1/repair_list_management/admin/repair_list/items/#{repair_list_item.id}", headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    #puts json
                    expect(json).not_to be_empty
                    expect(json['repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                    expect(json['repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                    expect(json['repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                    expect(json['repair_list_item']['component']['name']).to eql(component.name)
                    expect(json['repair_list_item']['comp']['name']).to eql(comp.name)
                    expect(json['repair_list_item']['dam']['name']).to eql(dam.name)
                    expect(json['repair_list_item']['rep']['name']).to eql(rep.name)
                    expect(json['repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                    expect(json['repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                    expect(json['repair_list_item']['event']['name']).to eql(event.name)
                    expect(json['repair_list_item']['unit']['name']).to eql(unit.name)
                    expect(json['repair_list_item']['deleted_at']).not_to eql(nil)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'Update a Repair List item' do
    # valid payload
        context 'success' do

            let!(:repair_list_item){ create(:repair_list_item, repair_list: repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            let!(:valid_attributes){ 
                {
                repair_list_item: {
                    repair_type_id: repair_type.id, 
                    non_mearsk_description: 'Random Description',
                    non_mearsk_hours: 54.0,
                    mearsk_max_material_cost: 500
                    }
                }
            }

            before { put "/api/v1/repair_list_management/admin/repair_list/items/#{repair_list_item.id}", params: valid_attributes, headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['repair_list_item']['component']['name']).to eql(component.name)
                expect(json['repair_list_item']['comp']['name']).to eql(comp.name)
                expect(json['repair_list_item']['dam']['name']).to eql(dam.name)
                expect(json['repair_list_item']['rep']['name']).to eql(rep.name)
                expect(json['repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                expect(json['repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['repair_list_item']['event']['name']).to eql(event.name)
                expect(json['repair_list_item']['unit']['name']).to eql(unit.name)
                expect(json['repair_list_item']['deleted_at']).to eql(nil)
                expect(json['repair_list_item']['non_mearsk_description']).to eql('Random Description')
                expect(json['repair_list_item']['mearsk_max_material_cost_dollars']).to eql('500.0')
                expect(json['repair_list_item']['mearsk_max_material_cost_cents']).to eql(500*100)
                expect(json['repair_list_item']['mearsk_max_material_cost_currency']).to eql('USD')
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Export a Repair List items' do
        # valid payload
            context 'success' do
    
                let!(:repair_list_item){ create(:repair_list_item, repair_list: repair_list, repair_type: repair_type, \
                    container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                    component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                    event: event, unit: unit) }

                before { get "/api/v1/repair_list_management/admin/repair_list/#{repair_list.id}/items/export", headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    #puts response.body
                    # puts response.headers
                    expect(response.headers['Content-Type']).to eq('text/csv')
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'Upload a Repair List item CSV' do
        # valid payload
            context 'success' do
                let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/Repair_list_sample.csv'))) }
                let!(:valid_attributes){
                    {
                        attachment: attachment
                    }
                }

                before { post "/api/v1/repair_list_management/admin/repair_list/#{repair_list.id}/items/upload", params: valid_attributes , headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    puts attachment.as_json
                    puts json
                    expect(response).to have_http_status(200)
                end
            end
        end
    
end