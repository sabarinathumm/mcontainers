require 'rails_helper'

RSpec.describe 'Admin::Customers', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:province){ create(:province) }
  let!(:city){ create(:city, province: province) }
  let!(:headers) { get_admin_headers(admin) }
  let!(:repair_list){ create(:repair_list, is_active: true) }
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
  let!(:repair_list_item){ create_list(:repair_list_item, 30, repair_list: repair_list, repair_type: repair_type, \
    container_damaged_area: container_damaged_area, container_repair_area: container_repair_area, \
    component: component, comp: comp, dam: dam, rep: rep, mode_number: mode_number, repair_mode: repair_mode, \
    event: event, unit: unit, location: 'DBXN') }

    describe 'List all Customers' do
    # valid payload
        context 'success' do

        let!(:customers){ create_list(:customer, 30) }
        before { get '/api/v1/user_management/admin/customers', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect((json)['customers'].count).to eql(20)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create a Customer without a repair list id/Default repair list id' do
    # valid payload
        context 'success' do
        let!(:valid_attributes){ 
            {
                customer: {
                    full_name: "Harry Styles", 
                    email: "harry@email.com", 
                    owner_name: "HRS Info", 
                    billing_name: "Harry", 
                    hourly_rate: 500, 
                    gst: 15.4, 
                    pst: 15.4, 
                    city_id: city.id,
                    province_id: province.id, 
                    address: "221 B, Bakers Street", 
                    zipcode: '456-098', 
                    password: "GhostFreak@123",
                    repair_list_id: 0,
                    is_active: true,
                    location: 'DBXN'
                }
            }
         }

        before { post '/api/v1/user_management/admin/customers', params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer']['full_name']).to eq('Harry Styles')
                expect(json['customer']['email']).to eq('harry@email.com')
                expect(json['customer']['owner_name']).to eq('HRS Info')
                expect(json['customer']['billing_name']).to eq('Harry')
                expect(Customer.find(json['customer']['id']).customer_repair_lists).not_to eq(nil)
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.name).to eq("Harry Styles #{repair_list.name}")
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.customer_repair_list_items.count).to eq(30)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create a Customer with a repair list id' do
    # valid payload
        context 'success' do

        let!(:customer){ create(:customer) }
        let!(:customer2){ create(:customer) }
        let!(:customer_repair_list){ create(:customer_repair_list, is_active: true, customer: customer2) }
        let!(:customer_repair_list_items){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, location: 'DBXN')}
        let!(:valid_attributes){ 
            {
                customer: {
                    full_name: "Harry Styles", 
                    email: "harry@email.com", 
                    owner_name: "HRS Info", 
                    billing_name: "Harry", 
                    hourly_rate: 500, 
                    gst: 15.4, 
                    pst: 15.4, 
                    city_id: city.id,
                    province_id: province.id, 
                    address: "221 B, Bakers Street", 
                    zipcode: '456-098', 
                    password: "GhostFreak@123",
                    repair_list_id: customer_repair_list.id,
                    is_active: true, 
                    location: 'DBXN'
                }
            }
         }

        before { post '/api/v1/user_management/admin/customers', params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer']['full_name']).to eq('Harry Styles')
                expect(json['customer']['email']).to eq('harry@email.com')
                expect(json['customer']['owner_name']).to eq('HRS Info')
                expect(json['customer']['billing_name']).to eq('Harry')
                expect(Customer.find(json['customer']['id']).customer_repair_lists).not_to eq(nil)
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.name).to eq("Harry Styles Version 1")
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.customer_repair_list_items.count).to eq(10)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Update a Customer with Default repair list id' do
    # valid payload
        context 'success' do

        let!(:customer){ create(:customer) }
        let!(:valid_attributes){ 
            {
                customer: {
                    full_name: "Bruno Mars", 
                    email: "bruno@email.com", 
                    owner_name: "Bruno ents Info", 
                    billing_name: "Russel", 
                    hourly_rate: 500, 
                    gst: 15.4, 
                    pst: 15.4, 
                    city_id: city.id,
                    province_id: province.id, 
                    address: "221 B, Bakers Street", 
                    zipcode: '456-098', 
                    password: "GhostFreak@123",
                    repair_list_id: 0,
                    is_active: true, 
                    location: 'DBXN'
                }
            }
         }

        before { put "/api/v1/user_management/admin/customers/#{customer.id}", params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer']['full_name']).to eq('Bruno Mars')
                expect(json['customer']['email']).to eq('bruno@email.com')
                expect(json['customer']['owner_name']).to eq('Bruno ents Info')
                expect(json['customer']['billing_name']).to eq('Russel')
                expect(json['customer']['address']).to eq('221 B, Bakers Street')
                expect(json['customer']['gst']).to eq(15.4)
                expect(json['customer']['pst']).to eq(15.4)
                expect(Customer.find(json['customer']['id']).customer_repair_lists).not_to eq(nil)
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.name).to eq("Bruno Mars #{repair_list.name}")
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.customer_repair_list_items.count).to eq(30)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Show a Customer ' do
    # valid payload
        context 'success' do

        let!(:customer){ create(:customer) }

        before { get "/api/v1/user_management/admin/customers/#{customer.id}", headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer']['full_name']).to eq(customer.full_name)
                expect(json['customer']['email']).to eq(customer.email)
                expect(json['customer']['owner_name']).to eq(customer.owner_name)
                expect(json['customer']['billing_name']).to eq(customer.billing_name)
                expect(json['customer']['address']).to eq(customer.address)
                expect(json['customer']['gst']).to eq(customer.gst)
                expect(json['customer']['pst']).to eq(customer.pst)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Update a Customer with a repair list id' do
    # valid payload
        context 'success' do

        let!(:customer){ create(:customer) }
        let!(:customer2){ create(:customer) }
        let!(:customer_repair_list){ create(:customer_repair_list, is_active: true, customer: customer2) }
        let!(:customer_repair_list_items){ create_list(:customer_repair_list_item, 10, customer_repair_list: customer_repair_list, location: 'DBXN')}
        let!(:valid_attributes){ 
            {
                customer: {
                    full_name: "Bruno Mars", 
                    email: "bruno@email.com", 
                    owner_name: "Bruno ents Info", 
                    billing_name: "Russel", 
                    hourly_rate: 500, 
                    gst: 15.4, 
                    pst: 15.4, 
                    city_id: city.id,
                    province_id: province.id, 
                    address: "221 B, Bakers Street", 
                    zipcode: '456-098', 
                    password: "GhostFreak@123",
                    repair_list_id: customer_repair_list.id,
                    is_active: true, 
                    location: 'DBXN'
                }
            }
         }

        before { put "/api/v1/user_management/admin/customers/#{customer.id}", params: valid_attributes ,headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(json['customer']['full_name']).to eq('Bruno Mars')
                expect(json['customer']['email']).to eq('bruno@email.com')
                expect(json['customer']['owner_name']).to eq('Bruno ents Info')
                expect(json['customer']['billing_name']).to eq('Russel')
                expect(json['customer']['address']).to eq('221 B, Bakers Street')
                expect(json['customer']['gst']).to eq(15.4)
                expect(json['customer']['pst']).to eq(15.4)
                expect(Customer.find(json['customer']['id']).customer_repair_lists).not_to eq(nil)
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.name).to eq("Bruno Mars Version 1")
                expect(Customer.find(json['customer']['id']).customer_repair_lists.first.customer_repair_list_items.count).to eq(10)
                expect(response).to have_http_status(200)
            end
        end
    end
    
end