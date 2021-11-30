require 'rails_helper'

RSpec.describe 'Admin::InvoiceManagement::', type: :request do
    # initialize test data 
    let!(:admin){ create(:admin) }
    let!(:headers) { get_admin_headers(admin) }
    let!(:customer){ create(:customer, billing_type: 'merc') }
    let!(:yard){ create(:yard, name: 'Alpha') }
    let!(:container_type){ create(:container_type) }
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
    let!(:length){ create(:length) }
    let!(:width){ create(:width) }
    let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/README.md'))) }
    let!(:uploaded_file){ create(:uploaded_file, attachment: attachment, user: admin) }
    let!(:container) { create(:container, container_type: container_type, yard: yard, customer: customer) }
    let!(:container_attachment) { create(:container_attachment, attachment: uploaded_file, attachment_type: 'left_side_photo', container: container) } 

    let!(:activity) { create_list(:activity, 10,  container: container, assigned_to: admin,activity_type: 'quote', activity_status: 'ready_for_billing') }

    # let!(:activity_item) {create(:activity_item, activity: activity, container_repair_area:          container_repair_area, container_damaged_area: container_damaged_area, unit: unit)}
    

    describe 'List all Activities with billed or ready_for_billing statuses' do
     # valid payload
        context 'success' do

            before { get "/api/v1/invoice_management/admin/invoices", headers: headers[:auth], as: :json }
            
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'show each invoice of the activity' do
        context 'return each invoice' do
            let!(:activity2) { create_list(:activity, 5, container: container, assigned_to: admin) }
            let!(:activity) {create(:activity,container: container, assigned_to: admin)}
            let!(:container) {create(:container, container_type: container_type, yard: yard, customer: customer )}
            let!(:repair_type) {create(:repair_type)}
            let!(:activity_items) {create(:activity_item, activity: activity, container_repair_area: container_repair_area, container_damaged_area: container_damaged_area, repair_type: repair_type, unit: unit, material_cost_cents: 100)}
            let!(:container_repair_area) {create(:container_repair_area)}
            let!(:container_damaged_area) {create(:container_damaged_area)}

            before { get "/api/v1/invoice_management/admin/invoices/#{activity.id}", headers: headers[:auth], as: :json }

            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                puts json
                #puts response.body
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Export Activities' do
        # valid payload
        context 'success' do
            let!(:activity2) { create_list(:activity, 5, container: container, assigned_to: admin) }
            let!(:activity) {create(:activity,container: container, assigned_to: admin)}
            let!(:container) {create(:container, container_type: container_type, yard: yard, customer: customer )}
            let!(:repair_type) {create(:repair_type)}
            let!(:activity_items) {create(:activity_item, activity: activity2.first, container_repair_area: container_repair_area, container_damaged_area: container_damaged_area, repair_type: repair_type, unit: unit)}
            let!(:container_repair_area) {create(:container_repair_area)}
            let!(:container_damaged_area) {create(:container_damaged_area)}
          
            let!(:valid_attributes){
                    {
                        activity_ids: [activity2.first.id, activity2.second.id]
                    }
                }
            before { post "/api/v1/invoice_management/admin/invoices/export", params: valid_attributes, headers: headers[:auth], as: :json }
    
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                puts response.body
                # puts response.headers
                expect(response.headers['Content-Type']).to eq('text/csv')
                expect(response).to have_http_status(200)
            end
        end
    end

end