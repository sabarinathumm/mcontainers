require 'rails_helper'

RSpec.describe 'Admin::CustomerRepairListItems::', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:headers) { get_admin_headers(admin) }
  let!(:customer){ create(:customer) }
  let!(:repair_type){ create(:repair_type, name:'Beta') }
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
  let!(:customer_repair_list){ create(:customer_repair_list, customer: customer) }
  let!(:customer_repair_list_item){ create(:customer_repair_list_item, customer_repair_list: customer_repair_list)}
  

    describe 'List all Repair List items of a List (which are not deleted)' do
    # valid payload
        context 'success' do
            
            let!(:customer_repair_list_item){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            let!(:customer_repair_list_item2){ create(:customer_repair_list_item, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit, deleted_at: DateTime.now) }

            before { get "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items", headers: headers[:auth], as: :json }

            it 'returns 20 items' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_items'].count).to eql(10)
                expect(json['customer_repair_list_items'][0]['repair_type']['name']).to eql(repair_type.name)
                expect(json['customer_repair_list_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_items'][0]['component']['name']).to eql(component.name)
                expect(json['customer_repair_list_items'][0]['comp']['name']).to eql(comp.name)
                expect(json['customer_repair_list_items'][0]['dam']['name']).to eql(dam.name)
                expect(json['customer_repair_list_items'][0]['rep']['name']).to eql(rep.name)
                expect(json['customer_repair_list_items'][0]['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_items'][0]['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_items'][0]['event']['name']).to eql(event.name)
                expect(json['customer_repair_list_items'][0]['unit']['name']).to eql(unit.name)
                expect(response).to have_http_status(200)
            end
        end

        context 'Second page listing' do
            
            let!(:customer_repair_list_item){ create_list(:customer_repair_list_item, 30, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            before { get "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items?page=2", headers: headers[:auth], as: :json }

            it 'returns Second page' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_items'].count).to eql(10)
                expect(json['customer_repair_list_items'][0]['repair_type']['name']).to eql(repair_type.name)
                expect(json['customer_repair_list_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_items'][0]['component']['name']).to eql(component.name)
                expect(json['customer_repair_list_items'][0]['comp']['name']).to eql(comp.name)
                expect(json['customer_repair_list_items'][0]['dam']['name']).to eql(dam.name)
                expect(json['customer_repair_list_items'][0]['rep']['name']).to eql(rep.name)
                expect(json['customer_repair_list_items'][0]['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_items'][0]['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_items'][0]['event']['name']).to eql(event.name)
                expect(json['customer_repair_list_items'][0]['unit']['name']).to eql(unit.name)
                expect(response).to have_http_status(200)
            end
        end

        context 'Filtering of Repair List Items' do
            
            let!(:customer_repair_list_item){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }
            let!(:customer_repair_list_item2){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            before { get "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items?search_text=&container_repair_area_id=#{container_repair_area.id}&container_damaged_area_id=#{container_damaged_area.id}&repair_type_id=#{repair_type.id}", headers: headers[:auth], as: :json }

            it 'returns filtered Repair List Items' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_items'].count).to eql(10)
                expect(json['customer_repair_list_items'][0]['repair_type']['name']).to eql(repair_type.name)
                expect(json['customer_repair_list_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_items'][0]['component']['name']).to eql(component.name)
                expect(json['customer_repair_list_items'][0]['comp']['name']).to eql(comp.name)
                expect(json['customer_repair_list_items'][0]['dam']['name']).to eql(dam.name)
                expect(json['customer_repair_list_items'][0]['rep']['name']).to eql(rep.name)
                expect(json['customer_repair_list_items'][0]['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_items'][0]['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_items'][0]['event']['name']).to eql(event.name)
                expect(json['customer_repair_list_items'][0]['unit']['name']).to eql(unit.name)
                expect(response).to have_http_status(200)
            end
        end


        context 'Sorting of Repair List Items' do
            
            let!(:customer_repair_list_item){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            let!(:repair_type2){ create(:repair_type, name: 'Alpha') }

            let!(:customer_repair_list_item2){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type2, \
                container_repair_area: container_repair_area, container_damaged_area: container_damaged_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            before { get "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items?repair_type=1", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_items'].count).to eql(20)
                expect(json['customer_repair_list_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_items'][0]['repair_type']['name']).to eql(repair_type2.name)
                expect(json['customer_repair_list_items'][0]['component']['name']).to eql(component.name)
                expect(json['customer_repair_list_items'][0]['comp']['name']).to eql(comp.name)
                expect(json['customer_repair_list_items'][0]['dam']['name']).to eql(dam.name)
                expect(json['customer_repair_list_items'][0]['rep']['name']).to eql(rep.name)
                expect(json['customer_repair_list_items'][0]['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_items'][0]['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_items'][0]['event']['name']).to eql(event.name)
                expect(json['customer_repair_list_items'][0]['unit']['name']).to eql(unit.name)
                expect(response).to have_http_status(200)
            end
        end

        context 'Searching of a Customer Repair List Items' do
            
            let!(:customer_repair_list_item){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            let!(:repair_type2){ create(:repair_type, name: 'Alpha') }

            let!(:customer_repair_list_item2){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, repair_type: repair_type2, \
                container_repair_area: container_repair_area, container_damaged_area: container_damaged_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            before { get "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items?search_text=#{customer_repair_list_item.first.uid[0..2]}&container_repair_area_id=&container_damaged_area_id=&repair_type_id=", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_items'].count).to eql(1)
                expect(json['customer_repair_list_items'][0]['uid']).to eql(customer_repair_list_item.first.uid)
                expect(json['customer_repair_list_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_items'][0]['repair_type']['name']).to eql(repair_type.name)
                expect(json['customer_repair_list_items'][0]['component']['name']).to eql(component.name)
                expect(json['customer_repair_list_items'][0]['comp']['name']).to eql(comp.name)
                expect(json['customer_repair_list_items'][0]['dam']['name']).to eql(dam.name)
                expect(json['customer_repair_list_items'][0]['rep']['name']).to eql(rep.name)
                expect(json['customer_repair_list_items'][0]['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_items'][0]['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_items'][0]['event']['name']).to eql(event.name)
                expect(json['customer_repair_list_items'][0]['unit']['name']).to eql(unit.name)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Show Repair List item' do
    # valid payload
        context 'success' do

            let!(:customer_repair_list_item){ create(:customer_repair_list_item, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            before { get "/api/v1/repair_list_management/admin/customer_repair_list/items/#{customer_repair_list_item.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['customer_repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_item']['component']['name']).to eql(component.name)
                expect(json['customer_repair_list_item']['comp']['name']).to eql(comp.name)
                expect(json['customer_repair_list_item']['dam']['name']).to eql(dam.name)
                expect(json['customer_repair_list_item']['rep']['name']).to eql(rep.name)
                expect(json['customer_repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_item']['event']['name']).to eql(event.name)
                expect(json['customer_repair_list_item']['unit']['name']).to eql(unit.name)
                expect(json['customer_repair_list_item']['deleted_at']).to eql(nil)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Soft Delete Repair List item' do
        # valid payload
            context 'success' do
    
                let!(:customer_repair_list_item){ create(:customer_repair_list_item, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                    container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                    component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                    event: event, unit: unit) }
    
                before { delete "/api/v1/repair_list_management/admin/customer_repair_list/items/#{customer_repair_list_item.id}", headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    #puts json
                    expect(json).not_to be_empty
                    expect(json['customer_repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                    expect(json['customer_repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                    expect(json['customer_repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                    expect(json['customer_repair_list_item']['component']['name']).to eql(component.name)
                    expect(json['customer_repair_list_item']['comp']['name']).to eql(comp.name)
                    expect(json['customer_repair_list_item']['dam']['name']).to eql(dam.name)
                    expect(json['customer_repair_list_item']['rep']['name']).to eql(rep.name)
                    expect(json['customer_repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                    expect(json['customer_repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                    expect(json['customer_repair_list_item']['event']['name']).to eql(event.name)
                    expect(json['customer_repair_list_item']['unit']['name']).to eql(unit.name)
                    expect(json['customer_repair_list_item']['deleted_at']).not_to eql(nil)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'Update a Repair List item' do
    # valid payload
        context 'success' do

            let!(:customer_repair_list_item){ create(:customer_repair_list_item, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                event: event, unit: unit) }

            let!(:valid_attributes){ 
                {
                customer_repair_list_item: {
                    is_non_mearsk_not_applicable: true,
                    repair_type_id: repair_type.id, 
                    non_mearsk_description: 'Random Description',
                    non_mearsk_hours: 54.0,
                    mearsk_max_material_cost: 500
                    }
                }
            }

            before { put "/api/v1/repair_list_management/admin/customer_repair_list/items/#{customer_repair_list_item.id}", params: valid_attributes, headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer_repair_list_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['customer_repair_list_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['customer_repair_list_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['customer_repair_list_item']['component']).to eql(nil)
                expect(json['customer_repair_list_item']['comp']).to eql(nil)
                expect(json['customer_repair_list_item']['dam']).to eql(nil)
                expect(json['customer_repair_list_item']['rep']).to eql(nil)
                expect(json['customer_repair_list_item']['mode_number']['name']).to eql(mode_number.name)
                expect(json['customer_repair_list_item']['repair_mode']['name']).to eql(repair_mode.name)
                expect(json['customer_repair_list_item']['event']).to eql(nil)
                expect(json['customer_repair_list_item']['unit']['name']).to eql(unit.name)
                expect(json['customer_repair_list_item']['deleted_at']).to eql(nil)
                expect(json['customer_repair_list_item']['non_mearsk_description']).to eql(nil)
                expect(json['customer_repair_list_item']['mearsk_max_material_cost_dollars']).to eql('500.0')
                expect(json['customer_repair_list_item']['mearsk_max_material_cost_cents']).to eql(500*100)
                expect(json['customer_repair_list_item']['mearsk_max_material_cost_currency']).to eql('USD')
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Export a Repair List items' do
        # valid payload
            context 'success' do
    
                let!(:customer_repair_list_item){ create(:customer_repair_list_item, customer_repair_list: customer_repair_list, repair_type: repair_type, \
                    container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
                    component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
                    event: event, unit: unit) }

                before { get "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items/export", headers: headers[:auth], as: :json }
    
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
                let!(:uploaded_file){ create(:uploaded_file, attachment: attachment, user: admin) }
                let!(:valid_attributes){
                    {
                        uploaded_file_id: uploaded_file.id
                    }
                }

                before { post "/api/v1/repair_list_management/admin/customer_repair_list/#{customer_repair_list.id}/items/upload", params: valid_attributes , \
                    headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    #puts json
                    expect(response).to have_http_status(201)
                end
            end
    end
end