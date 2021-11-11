require 'rails_helper'

RSpec.describe 'Admin::ActivityManagement::', type: :request do
    # initialize test data 
    let!(:admin){ create(:admin) }
    let!(:headers) { get_admin_headers(admin) }
    let!(:customer){ create(:customer) }
    let!(:yard){ create(:yard, name: 'Alpha') }
    let!(:container_type){ create(:container_type) }
    let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/README.md'))) }
    let!(:uploaded_file){ create(:uploaded_file, attachment: attachment, user: admin) }
    let!(:container) { create(:container, container_type: container_type, yard: yard, customer: customer) }
    let!(:container_attachment) { create(:container_attachment, attachment: uploaded_file, attachment_type: 'left_side_photo', container: container) } 
    let!(:activity) { create(:activity, container: container, assigned_to: admin) }
    let!(:repair_type){ create(:repair_type, name:'Beta') }
    let!(:unit){ create(:unit, name: 'Feet') }
    let!(:container_damaged_area){ create(:container_damaged_area) }
    let!(:container_repair_area){ create(:container_repair_area) }
    let!(:activity_item) { create(:activity_item, activity: activity, repair_type: repair_type, container_damaged_area: container_damaged_area, \
        container_repair_area: container_repair_area, damaged_area_image: uploaded_file, repaired_area_image: uploaded_file, unit: unit) }

    describe 'List all Activity Items for an activity' do
    # valid payload
        context 'success' do

        before { get "/api/v1/activity_management/admin/activities/#{activity.id}/activity_items", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activity_items'][0]['repair_code']).to eql(activity_item.repair_code)
                expect(json['activity_items'][0]['length']).to eql(activity_item.length)
                expect(json['activity_items'][0]['location']).to eql(activity_item.location)
                expect(json['activity_items'][0]['hours']).to eql(activity_item.hours)
                expect(json['activity_items'][0]['repair_type']['name']).to eql(repair_type.name)
                expect(json['activity_items'][0]['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['activity_items'][0]['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['activity_items'][0]['damaged_area_image']['id']).to eql(uploaded_file.id)
                expect(json['activity_items'][0]['damaged_area_image']['attachment_url']).to eql(uploaded_file.attachment_url)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Show an Activity Item' do
    # valid payload
        context 'success' do

            before { get "/api/v1/activity_management/admin/activities/#{activity.id}/activity_items/#{activity_item.id}" ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activity_item']['repair_code']).to eql(activity_item.repair_code)
                expect(json['activity_item']['length']).to eql(activity_item.length)
                expect(json['activity_item']['location']).to eql(activity_item.location)
                expect(json['activity_item']['hours']).to eql(activity_item.hours)
                expect(json['activity_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['activity_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['activity_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['activity_item']['damaged_area_image']['id']).to eql(uploaded_file.id)
                expect(json['activity_item']['damaged_area_image']['attachment_url']).to eql(uploaded_file.attachment_url)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create an Activity Item for an activity' do
    # valid payload
        context 'success' do
            
            let!(:valid_attributes){
                {
                    activity_item:{
                        repair_code: "4570",
                        repair_type_id: repair_type.id,
                        container_damaged_area_id: container_damaged_area.id,
                        container_repair_area_id: container_repair_area.id,
                        length: 45.0,
                        width: 79.7,
                        unit_id: unit.id,
                        hours: 55.0,
                        damaged_area_image_id: uploaded_file.id,
                        repaired_area_image_id: uploaded_file.id,
                        comments: "No comments Simple waste",
                        labour_cost: 500.0,
                        material_cost: 8000.0,
                        total_cost: 8500.0
                    }
                }
            }

            before { post "/api/v1/activity_management/admin/activities/#{activity.id}/activity_items", params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activity_item']['repair_code']).to eql('4570')
                expect(json['activity_item']['length']).to eql(45.0)
                expect(json['activity_item']['labour_cost_dollars']).to eql('500.0')
                expect(json['activity_item']['hours']).to eql(55.0)
                expect(json['activity_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['activity_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['activity_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['activity_item']['damaged_area_image']['id']).to eql(uploaded_file.id)
                expect(json['activity_item']['damaged_area_image']['attachment_url']).to eql(uploaded_file.attachment_url)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Update an Activity Item' do
    # valid payload
        context 'success' do
            
            let!(:valid_attributes){
                {
                    activity_item:{
                        repair_code: "4570",
                        repair_type_id: repair_type.id,
                        container_damaged_area_id: container_damaged_area.id,
                        container_repair_area_id: container_repair_area.id,
                        length: 45.0,
                        width: 79.7,
                        hours: 55.0,
                        damaged_area_image_id: uploaded_file.id,
                        repaired_area_image_id: uploaded_file.id,
                        comments: "No comments Simple waste",
                        labour_cost: 500.0,
                        material_cost: 8000.0,
                        total_cost: 8500.0
                    }
                }
            }

            before { put "/api/v1/activity_management/admin/activities/#{activity.id}/activity_items/#{activity_item.id}", params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activity_item']['repair_code']).to eql('4570')
                expect(json['activity_item']['length']).to eql(45.0)
                expect(json['activity_item']['labour_cost_dollars']).to eql('500.0')
                expect(json['activity_item']['hours']).to eql(55.0)
                expect(json['activity_item']['comments']).to eql('No comments Simple waste')
                expect(json['activity_item']['repair_type']['name']).to eql(repair_type.name)
                expect(json['activity_item']['container_repair_area']['name']).to eql(container_repair_area.name)
                expect(json['activity_item']['container_damaged_area']['name']).to eql(container_damaged_area.name)
                expect(json['activity_item']['damaged_area_image']['id']).to eql(uploaded_file.id)
                expect(json['activity_item']['damaged_area_image']['attachment_url']).to eql(uploaded_file.attachment_url)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Delete an Activity Item' do
    # valid payload
        context 'success' do

            before { delete "/api/v1/activity_management/admin/activities/#{activity.id}/activity_items/#{activity_item.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(response).to have_http_status(204)
            end
        end
    end

end