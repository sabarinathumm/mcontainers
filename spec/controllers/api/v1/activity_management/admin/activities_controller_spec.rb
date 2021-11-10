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

    describe 'List all Activities' do
    # valid payload
        context 'success' do

        before { get '/api/v1/activity_management/admin/activities', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('quote')
                expect(json['activities'][0]['activity_status']).to eql('quote_draft')
                expect(json['activities'][0]['created_at']).to eql(activity.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'List all Activities - With filters' do
        # valid payload
        context 'success' do
    
            before { get "/api/v1/activity_management/admin/activities?date=#{Time.now.utc.to_date}&customer_id=#{customer.id}&activity_status=quote_draft&activity_type=quote&yard_id=#{yard.id}", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('quote')
                expect(json['activities'][0]['activity_status']).to eql('quote_draft')
                expect(json['activities'][0]['created_at']).to eql(activity.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Search Activities - With Status filters' do
        # valid payload
        context 'success' do

            let!(:activity2) { create(:activity, container: container, assigned_to: admin, activity_status: 'pending_customer_approval') }
    
            before { get "/api/v1/activity_management/admin/activities?status=customer_pending&search_text=#{container.container_uid}", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity2.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('quote')
                expect(json['activities'][0]['activity_status']).to eql('pending_customer_approval')
                expect(json['activities'][0]['created_at']).to eql(activity2.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Sort Activities by' do
        # valid payload
        context 'yard name success' do

            let!(:yard2){ create(:yard, name: 'Beta') }
            let!(:container2) { create(:container, container_type: container_type, yard: yard2, customer: customer) }
            let!(:activity2) { create(:activity, container: container2, assigned_to: admin, activity_status: 'pending_customer_approval') }
    
            before { get "/api/v1/activity_management/admin/activities?yard_name=-1", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity2.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container2.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard2.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container2.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('quote')
                expect(json['activities'][0]['activity_status']).to eql('pending_customer_approval')
                expect(json['activities'][0]['created_at']).to eql(activity2.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container2.id)
                expect(response).to have_http_status(200)
            end
        end

        context 'Owner name success' do

            let!(:container2) { create(:container, container_type: container_type, yard: yard, customer: customer, container_owner_name: 'ZZZZZZ') }
            let!(:activity2) { create(:activity, container: container2, assigned_to: admin, activity_status: 'pending_customer_approval') }
    
            before { get "/api/v1/activity_management/admin/activities?owner_name=-1", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity2.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container2.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container2.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('quote')
                expect(json['activities'][0]['activity_status']).to eql('pending_customer_approval')
                expect(json['activities'][0]['created_at']).to eql(activity2.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container2.id)
                expect(response).to have_http_status(200)
            end
        end

        context 'Activity Type success' do

            let!(:container2) { create(:container, container_type: container_type, yard: yard, customer: customer, container_owner_name: 'ZZZZZZ') }
            let!(:activity2) { create(:activity, container: container2, assigned_to: admin, activity_status: 'pending_customer_approval', activity_type: 'repair') }
    
            before { get "/api/v1/activity_management/admin/activities?activity_type_sort=-1", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity2.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container2.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container2.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('repair')
                expect(json['activities'][0]['activity_status']).to eql('pending_customer_approval')
                expect(json['activities'][0]['created_at']).to eql(activity2.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container2.id)
                expect(response).to have_http_status(200)
            end
        end

        context 'Activity Status success' do

            let!(:container2) { create(:container, container_type: container_type, yard: yard, customer: customer, container_owner_name: 'ZZZZZZ') }
            let!(:activity2) { create(:activity, container: container2, assigned_to: admin, activity_status: 'repair_pending_admin_approval', activity_type: 'repair') }
    
            before { get "/api/v1/activity_management/admin/activities?activity_status_sort=-1", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'][0]['activity_uid']).to eql(activity2.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container2.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container2.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('repair')
                expect(json['activities'][0]['activity_status']).to eql('repair_pending_admin_approval')
                expect(json['activities'][0]['created_at']).to eql(activity2.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container2.id)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'List activities of a container' do
        # valid payload
        context 'success' do
    
            let!(:activity2) { create_list(:activity, 5, container: container, assigned_to: admin) }
            before { get "/api/v1/activity_management/admin/container_activities?container_id=#{container.id}", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['activities'].count).to eql(6)
                expect(json['activities'][0]['activity_uid']).to eql(activity.activity_uid)
                expect(json['activities'][0]['container_number']).to eql(container.container_uid)
                expect(json['activities'][0]['yard_name']).to eql(yard.name)
                expect(json['activities'][0]['customer_name']).to eql(customer.full_name)
                expect(json['activities'][0]['owner_name']).to eql(container.container_owner_name)
                expect(json['activities'][0]['activity_type']).to eql('quote')
                expect(json['activities'][0]['activity_status']).to eql('quote_draft')
                expect(json['activities'][0]['created_at']).to eql(activity.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
                expect(response).to have_http_status(200)
                puts "Container Activities ch ahe"
            end
        end
    end

    describe 'Update activity statuses' do
        # valid payload
        context 'success' do
    
            let!(:activity2) { create_list(:activity, 5, container: container, assigned_to: admin) }
            let!(:valid_attributes){
                {
                    activity_ids: [activity2.first.id, activity2.second.id],
                    activity_status: 'ready_for_billing'
                }
            }
            before { post "/api/v1/activity_management/admin/activities/update_status", params: valid_attributes ,headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Export Activities' do
        # valid payload
        context 'success' do
    
            let!(:activity2) { create_list(:activity, 5, container: container, assigned_to: admin) }

            before { get "/api/v1/activity_management/admin/activities/export", headers: headers[:auth], as: :json }
    
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts response.body
                # puts response.headers
                expect(response.headers['Content-Type']).to eq('text/csv')
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'show each activty of a container' do
        context 'sucess' do
            let!(:container2) { create(:container, container_type: container_type, yard: yard, customer: customer, container_owner_name: 'ZZZZZZ') }
            let!(:activity2) { create_list(:activity, 5, container: container, assigned_to: admin) }
            before { get "/api/v1/activity_management/admin/activities/#{activity.id}", headers: headers[:auth], as: :json }

            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                expect(json).not_to be_empty
                puts response.body
                # expect(json['activity'][0]['activity_uid']).to eql(activity.activity_uid)
                # expect(json['activity'][0]['container_number']).to eql(container2.container_uid)
                # expect(json['activity'][0]['yard_name']).to eql(yard.name)
                # expect(json['activity'][0]['customer_name']).to eql(customer.full_name)
                # expect(json['activity'][0]['owner_name']).to eql(container2.container_owner_name)
                # expect(json['activity'][0]['activity_type']).to eql('repair')
                # expect(json['activity'][0]['activity_status']).to eql('repair_pending_admin_approval')
                # expect(json['activity'][0]['created_at']).to eql(activity2.created_at.strftime("%d-%b-%Y"))
                # expect(json['activity'][0]['container']['id']).to eql(container2.id)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Delete' do
        context 'sucessful delete' do 
            before { delete "/api/v1/activity_management/admin/activities/#{activity.id}", headers: headers[:auth], as: :json }
            it 'return 204' do 
                # puts json
                expect(response).to have_http_status(204)
            end
        end
    end

    describe 'Add activity / Create activity' do
        context 'Sucessful creation' do
            let!(:valid_attributes){
                    {
                        activity_type: "quote",
                        activity_date: "20-Aug-2021"
                    }
                }
            before {post "/api/v1/activity_management/admin/activities",params: valid_attributes, headers: headers[:auth], as: :json}
            it 'return 200' do
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Update activity status' do
        context 'Sucessful updation' do
            let!(:valid_attributes){
                {
                    "activity":
                        {
                            "activity_status": "repair_done",
                            "activity_type": "repair"
                        }
                }
                }
            before {put "/api/v1/activity_management/admin/activities/#{activity.id}",params: valid_attributes, headers: headers[:auth], as: :json}
            it 'return 200' do
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end
end