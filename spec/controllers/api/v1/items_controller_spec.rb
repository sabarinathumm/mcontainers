require 'rails_helper'

RSpec.describe 'ITEM:', type: :request do
  # initialize test data 
 
  let!(:items){create_list(:item, 30)} 

  # Test suite for Get /api/v1/items
  describe 'List Items' do
    # valid payload
    context '(success)' do

      #get request will not have a request payload

      before { get '/api/v1/items/' }

      it 'returns items' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect((json)['items'].count).to eql(10)
        expect(response).to have_http_status(200)        
      end
    end
  end

  describe 'View Item' do
    # valid payload
    context '(success)' do

      #get request will not have a request payload

      before { get "/api/v1/items/#{items.first.id}"}

      it 'returns item' do
        
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect((json)['item']['id']).to eql(items.first.id)
        expect(response).to have_http_status(200)        
      end
    end
    
    context '(item not found)' do

      #get request will not have a request payload

      before { get "/api/v1/items/0"}

      it 'returns item error' do
        expect(response).to have_http_status(422)        
      end
    end
  end
   
  describe 'Create Item' do
    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { item: { 
             title: "english",
             description: "this is  subject.",
            }
        }
      }
 
      

      before { post '/api/v1/items/', params: valid_attributes, as: :json}
      
      it 'returns item' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(response).to have_http_status(201)        
      end
    end
  end
  
  describe 'Edit Item' do
    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { item: { 
             title: "engledit1",
             description: "edit1  subject.",
            }
        }
      }

      before { put "/api/v1/items/#{items.first.id}", params: valid_attributes, as: :json}
      
      it 'returns item' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect((json)['item']['id']).to eql(items.first.id)
        expect((json)['item']['title']).to eql('engledit1')
        expect(response).to have_http_status(200)        
      end
    end
  end
 
  describe 'Delete Item' do
    # valid payload
    context '(success)' do
      
      before { delete "/api/v1/items/#{items.first.id}"}
      
      it 'returns empty' do
        # Note `json` is a custom helper to parse JSON responses
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)        
      end
    end
  end

end
