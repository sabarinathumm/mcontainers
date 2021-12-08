require 'rails_helper'

RSpec.describe 'Admin::Profiles', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:headers) { get_admin_headers(admin) }

    describe 'List all Admins/Employee details' do
    # valid payload
        context 'success' do

        let!(:admins){ create_list(:admin, 30) }
        before { get '/api/v1/user_management/admin/profiles', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                puts json
                expect(json).not_to be_empty
                expect((json)['admins'].count).to eql(31)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create a Profile' do
    # valid payload
        context 'success' do
        let!(:valid_attributes){ 
            {
                admin:{
                    first_name: "Harry", 
                    last_name: "Styles", 
                    email: "harry@email.com", 
                    phone_number: '9898989898',
                    role: 'administrator',
                    password: "Password@123",
                    is_active: true,
                }
            }
         }

        before { post '/api/v1/user_management/admin/profiles', params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['admin']['first_name']).to eq('Harry')
                expect(json['admin']['last_name']).to eq('Styles')
                expect(json['admin']['email']).to eq('harry@email.com')
                expect(json['admin']['phone_number']).to eq('9898989898')
                expect(json['admin']['role']).to eq('administrator')
                
                expect(json['admin']['is_active']).to eq(admin.is_active)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Update a Profile information' do
    # valid payload
        context 'success' do

        let!(:admin){ create(:admin) }
        let!(:valid_attributes){ 
            {
                admin: {
                    first_name: "Harrie", 
                    last_name: "Style", 
                    email: "harrie@email.com", 
                    phone_number: '9898989898',
                    role: 'administrator',
                    password: "GhostFreak@123",
                    is_active: true,
                }
            }
         }

        before { put "/api/v1/user_management/admin/profiles/#{admin.id}", params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                expect(json).not_to be_empty
                expect(json['admin']['first_name']).to eq('Harrie')
                expect(json['admin']['last_name']).to eq('Style')
                expect(json['admin']['email']).to eq('harrie@email.com')
                expect(json['admin']['phone_number']).to eq('9898989898')
                expect(json['admin']['role']).to eq('administrator')
               
                expect(json['admin']['is_active']).to eq(admin.is_active)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Show a Profile ' do
    # valid payload
        context 'success' do

        let!(:admin){ create(:admin) }

        before { get "/api/v1/user_management/admin/profiles/#{admin.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                expect(json).not_to be_empty
                expect(json['admin']['first_name']).to eq(admin.first_name)
                expect(json['admin']['last_name']).to eq(admin.last_name)
                expect(json['admin']['email']).to eq(admin.email)
                expect(json['admin']['phone_number']).to eq(admin.phone_number)
                expect(json['admin']['role']).to eq('administrator')
                expect(json['admin']['is_active']).to eq(admin.is_active)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Delete an Profile' do
        # valid payload
            context 'success' do
    
                before { delete "/api/v1/user_management/admin/profiles/#{admin.id}", headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    # puts json
                    expect(response).to have_http_status(204)
                end
            end
        end

    
end