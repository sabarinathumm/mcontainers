require 'rails_helper'

RSpec.describe 'Admin::ContainerManagement::', type: :request do
    # initialize test data 
    let!(:admin){ create(:admin) }
    let!(:headers) { get_admin_headers(admin) }
    let!(:customer){ create(:customer) }
    let!(:yard){ create(:yard) }
    let!(:container_type){ create(:container_type) }
    let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/README.md'))) }
    let!(:uploaded_file){ create(:uploaded_file, attachment: attachment, user: admin) }
    let!(:container) { create(:container, container_type: container_type, yard: yard, customer: customer) }
    let!(:container_attachment) { create(:container_attachment, attachment: uploaded_file, attachment_type: 'left_side_photo', container: container) } 

    describe 'List all Containers' do
    # valid payload
        context 'success' do

        before { get '/api/v1/container_management/admin/containers', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['containers'].count).to eql(1)
                expect(json['containers'][0]['container_uid']).not_to be_empty
                expect(json['containers'][0]['container_attachments'][0]['attachment_type']).to eq('left_side_photo')
                expect(json['containers'][0]['container_attachments']).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create a new Container' do
    # valid payload
        context 'success' do

            let!(:valid_attributes){
                {
                    container: {
                        yard_id: yard.id,
                        container_uid: 'CON4567FG',
                        customer_id: customer.id,
                        container_owner_name: 'Robert Bosch',
                        submitter_initials: 'MG. C',
                        container_length: 45.67,
                        container_width: 56.09,
                        container_type_id: container_type.id,
                        location: 'DBXN',
                        comments: 'Random Comments',
                        manufacture_year: 2021,    
                        container_attachments: [
                            {
                                attachment_type: 'left_side_photo',
                                attachment_id: uploaded_file.id
                            },
                            {
                                attachment_type: 'right_side_photo',
                                attachment_id: uploaded_file.id
                            },
                            {
                                attachment_type: 'csc_plate_number',
                                attachment_id: uploaded_file.id
                            }
                        ]
                    }
                }
            }

            before { post '/api/v1/container_management/admin/containers', params: valid_attributes, headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['container']['container_uid']).to eql('CON4567FG')
                expect(json['container']['container_owner_name']).to eql('Robert Bosch')
                expect(json['container']['submitter_initials']).to eql('MG. C')
                expect(json['container']['container_length']).to eql(45.67)
                expect(json['container']['container_width']).to eql(56.09)
                expect(json['container']['location']).to eql('DBXN')
                expect(json['container']['comments']).to eql('Random Comments')
                expect(json['container']['container_type']['name']).to eql(container_type.name)
                expect(json['container']['customer']['full_name']).to eql(customer.full_name)
                expect(json['container']['container_attachments']).not_to be_empty
                expect(json['container']['container_attachments'].count).to eql(3)
                expect(json['container']['container_attachments'][0]['attachment_url']).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Update a Container' do
        # valid payload
            context 'success' do
    
                let!(:valid_attributes){
                    {
                        container: {
                            yard_id: yard.id,
                            container_uid: container.container_uid,
                            customer_id: customer.id,
                            container_owner_name: container.container_owner_name,
                            submitter_initials: container.submitter_initials,
                            container_length: container.container_length,
                            container_width: container.container_width,
                            container_type_id: container_type.id,
                            location: 'DBXN',
                            comments: container.comments,
                            manufacture_year: 2021,    
                            container_attachments: [
                                {
                                    attachment_type: 'left_side_photo',
                                    attachment_id: uploaded_file.id
                                },
                                {
                                    attachment_type: 'right_side_photo',
                                    attachment_id: uploaded_file.id
                                },
                                {
                                    attachment_type: 'csc_plate_number',
                                    attachment_id: uploaded_file.id
                                }
                            ]
                        }
                    }
                }
    
                before { put "/api/v1/container_management/admin/containers/#{container.id}", params: valid_attributes, headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    puts json
                    expect(json).not_to be_empty
                    expect(json['container']['container_uid']).to eql(container.container_uid)
                    expect(json['container']['container_owner_name']).to eql(container.container_owner_name)
                    expect(json['container']['submitter_initials']).to eql(container.submitter_initials)
                    expect(json['container']['container_length']).to eql(container.container_length)
                    expect(json['container']['container_width']).to eql(container.container_width)
                    expect(json['container']['location']).to eql('DBXN')
                    expect(json['container']['comments']).to eql(container.comments)
                    expect(json['container']['container_type']['name']).to eql(container_type.name)
                    expect(json['container']['customer']['full_name']).to eql(customer.full_name)
                    expect(json['container']['container_attachments'][0]).not_to be_empty
                    expect(json['container']['container_attachments'].count).to eql(3)
                    expect(json['container']['container_attachments'][0]['attachment_url']).not_to be_empty
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'Show a Container' do
    # valid payload
        context 'success' do

            let!(:containers) { create_list(:container, 10, container_type: container_type, yard: yard, customer: customer) }
            before { get "/api/v1/container_management/admin/containers/#{container.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['container']['container_uid']).to eql(container.container_uid)
                expect(json['container']['container_owner_name']).to eql(container.container_owner_name)
                expect(json['container']['submitter_initials']).to eql(container.submitter_initials)
                expect(json['container']['container_length']).to eql(container.container_length)
                expect(json['container']['container_width']).to eql(container.container_width)
                expect(json['container']['location']).to eql(container.location)
                expect(json['container']['comments']).to eql(container.comments)
                expect(json['container']['container_type']['name']).to eql(container_type.name)
                expect(json['container']['customer']['full_name']).to eql(customer.full_name)
                expect(json['container']['container_attachments'].count).to eql(1)
                expect(json['container']['container_attachments'][0]['attachment_url']).not_to be_empty
                expect(json['container']['container_attachments'][0]['attachment_type']).to eql('left_side_photo')
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Download attachments of a Container' do
        # valid payload
        context 'success' do
    
            before { get "/api/v1/container_management/admin/containers/#{container.id}/download", headers: headers[:auth], as: :json }
    
            it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(response.headers['Content-Type']).to eq('application/zip')
                    expect(response).to have_http_status(200)
            end
        end
    end
end