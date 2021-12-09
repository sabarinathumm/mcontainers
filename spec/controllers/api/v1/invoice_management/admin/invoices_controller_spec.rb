require 'rails_helper'

RSpec.describe 'Admin::InvoiceManagement::', type: :request do
    # initialize test data 
    let!(:admin){ create(:admin) }
    let!(:headers) { get_admin_headers(admin) }
    let!(:customer){ create(:customer, billing_type: 'common') }
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
    let!(:repair_type){ create(:repair_type) }
    let!(:event){ create(:event) }
    let!(:unit){ create(:unit) }
    let!(:length){ create(:length) }
    let!(:width){ create(:width) }
    let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/README.md'))) }
    let!(:uploaded_file){ create(:uploaded_file, attachment: attachment, user: admin) }
    let!(:container) { create(:container, container_type: container_type, yard: yard, customer: customer) }
    let!(:container_attachment) { create(:container_attachment, attachment: uploaded_file, attachment_type: 'left_side_photo', container: container) } 

    let!(:activity) { create_list(:activity, 10,  container: container, assigned_to: admin,activity_type: 'quote', activity_status: 'ready_for_billing') }

    let!(:invoice) { create(:invoice, customer: customer)}
    

    describe 'List all Activities with ready_for_billing statuses' do
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
                # puts response.body
                # puts response.headers
                expect(response.headers['Content-Type']).to eq('text/csv')
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Create invoice' do
        context 'Sucessful creation' do
            let!(:activity) {create(:activity,container: container, assigned_to: admin)}
            let!(:activity_items) { create_list(:activity_item, 5,activity: activity, labour_cost: 500, material_cost: 500, total_cost: 1000, repair_type: repair_type, container_damaged_area: container_damaged_area, \
                container_repair_area: container_repair_area, damaged_area_image: uploaded_file, repaired_area_image: uploaded_file, unit: unit, length: length, width: width) }
            
                let!(:valid_attributes){
                {
                    activity_ids: [activity.id]
                }
            }

            before {post "/api/v1/invoice_management/admin/invoices",params: valid_attributes, headers: headers[:auth], as: :json}
            it 'return 200' do
                # puts json
                # puts activity.first.id
                expect(json).not_to be_empty
                expect(response).to have_http_status(201)
            end
        end
    end

    describe 'List all invoices with billed statuses' do
        # valid payload
        context 'success' do
            
            let!(:activity) { create_list(:activity, 5, container: container, assigned_to: admin, activity_status: 'billed') }
            let!(:invoice) { create(:invoice, status: 'invoiced', activities: activity) }
            let!(:invoice2) { create(:invoice, status: 'void', activities: [activity.first , activity.second]) }
            # let!(:activities_invoices) {create(:activities_invoices, activity: activity, invoice: invoice, activity_id: activity.id, invoice_id: invoice.id )}

            before { get "/api/v1/invoice_management/admin/invoice_history", headers: headers[:auth], as: :json }
            
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Show each invoice history' do
        context 'return each invoice' do
            let!(:invoice_activity_items){create(:invoice_activity_item, invoice: invoice,container_repair_area: container_repair_area, container_damaged_area: container_damaged_area, repair_type: repair_type, location: 'DBXN' ) }

            let!(:activities_invoice) {create(:activities_invoice, activity: activity.first, invoice: invoice)}

            before { get "/api/v1/invoice_management/admin/invoices/#{invoice.id}", headers: headers[:auth], as: :json }

            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                puts json
                #puts response.body
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
                puts "200"
            end
        end
    end 

    describe 'Update Invoice status' do
        # valid payload
        context 'success' do
    
            let!(:invoice) { create_list(:invoice, 5, activities: activity, status: 'invoiced') }
            let!(:valid_attributes){
                {
                    invoice_ids: [invoice.first.id, invoice.second.id],
                    status: 'void'
                }
            }
            before { post "/api/v1/invoice_management/admin/invoices/mark_void", params: valid_attributes ,headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                # puts json
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'Mail Invoice to Customer' do
        # valid payload
        context 'success' do
    
            # let!(:invoice) { create_list(:invoice, 5, activities: activity) }

            before { post "/api/v1/invoice_management/admin/mail_invoice/#{invoice.id}", headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                puts json
                
                expect(response).to have_http_status(201)
                
            end
        end
    end

    describe 'Print Invoice ' do
        # valid payload
        context 'success' do
    
            let!(:invoice) { create_list(:invoice, 5, activities: activity) }
           
            before { post "/api/v1/invoice_management/admin/", params: valid_attributes ,headers: headers[:auth], as: :json }
    
            it 'returns the filtered activity' do
                # Note `json` is a custom helper to parse JSON responses
                #puts json
                expect(json).not_to be_empty
                expect(response).to have_http_status(200)
            end
        end
    end
end