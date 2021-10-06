require 'rails_helper'

RSpec.describe 'Admin::ActivityManagement::', type: :request do
    # initialize test data 
    let!(:admin){ create(:admin) }
    let!(:headers) { get_admin_headers(admin) }
    let!(:customer){ create(:customer) }
    let!(:yard){ create(:yard) }
    let!(:container_type){ create(:container_type) }
    let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/README.md'))) }
    let!(:container) { create(:container, container_type: container_type, yard: yard, customer: customer) }
    let!(:container_attachment) { create(:container_attachment, attachment: attachment, attachment_type: 'left_side_photo', container: container) } 
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
                expect(json['activities'][0]['activity_status']).to eql('pending')
                expect(json['activities'][0]['created_at']).to eql(activity.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'List all Activities - With filters' do
        # valid payload
        context 'success' do
    
            before { get "/api/v1/activity_management/admin/activities?date=#{Time.now.utc.to_date}&customer_id=#{customer.id}&activity_status=pending&activity_type=quote&yard_id=#{yard.id}", headers: headers[:auth], as: :json }
    
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
                expect(json['activities'][0]['activity_status']).to eql('pending')
                expect(json['activities'][0]['created_at']).to eql(activity.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
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
                expect(json['activities'][0]['activity_status']).to eql('pending')
                expect(json['activities'][0]['created_at']).to eql(activity.created_at.strftime("%d-%b-%Y"))
                expect(json['activities'][0]['container']['id']).to eql(container.id)
                expect(response).to have_http_status(200)
            end
        end
    end
end