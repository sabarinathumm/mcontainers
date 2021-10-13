require 'rails_helper'

RSpec.describe 'File Management::Uploaded Files:', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:attachment) { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/README.md'))) }
  let!(:headers) { get_admin_headers(admin) }


   # Test suite for POST /api/v1/file_management/uploaded_files
   describe 'Upload Files' do
    # valid payload
    context 'success' do

      let(:valid_attributes) { 
        { 
          attachment: attachment
        }
      }

      before { post '/api/v1/file_management/uploaded_files', params: valid_attributes, headers: headers[:auth].merge('CONTENT_TYPE' => 'multipart/form-data') }

      it 'returns file details' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['uploaded_file']['id']).not_to eq(nil)
        expect(json['uploaded_file']['attachment_url']).not_to eq(nil)
        expect(response).to have_http_status(201)
      end
    end

  end

end