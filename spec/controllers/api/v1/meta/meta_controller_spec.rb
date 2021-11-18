require 'rails_helper'

RSpec.describe 'Meta::', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:headers) { get_admin_headers(admin) }
  let!(:repair_types){ create_list(:repair_type, 10) }
  let!(:container_damaged_areas){ create_list(:container_damaged_area, 10) }
  let!(:container_repair_areas){ create_list(:container_repair_area, 10) }
  let!(:components){ create_list(:component, 10) }
  let!(:comps){ create_list(:comp, 10) }
  let!(:reps){ create_list(:rep, 10) }
  let!(:dams){ create_list(:dam, 10) }
  let!(:mode_numbers){ create_list(:mode_number, 10) }
  let!(:repair_modes){ create_list(:repair_mode, 10) }
  let!(:events){ create_list(:event, 10) }
  let!(:units){ create_list(:unit, 10) }
  let!(:lengths){ create_list(:length, 10) }
  let!(:widths){ create_list(:width, 10) }
  let!(:provinces){ create_list(:province, 10) }
  let!(:cities){ create_list(:city, 10, province: provinces.first) }
  let!(:yards){ create_list(:yard, 10) }
  let!(:container_types){ create_list(:container_type, 10) }

    describe 'List all Repair Types' do
    # valid payload
        context 'success' do

        before { get '/api/v1/meta/repair_types', headers: headers[:auth], as: :json }

            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                expect(json).not_to be_empty
                expect((json)['repair_types'].count).to eql(10)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'List all Continer Repair Areas' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/container_repair_areas', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['container_repair_areas'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Continer Damaged Areas' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/container_damaged_areas', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['container_damaged_areas'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all components' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/components', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['components'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all COMPs' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/comps', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['comps'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all REP' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/reps', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['reps'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all DAMs' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/dams', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['dams'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Events' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/events', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['events'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Mode Numbers' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/mode_numbers', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['mode_numbers'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Repair Modes' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/repair_modes', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['repair_modes'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Units' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/units', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['units'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Lengths' do
        # valid payload
        context 'success' do
        
        before { get '/api/v1/meta/lengths', headers: headers[:auth], as: :json }
        
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                expect(json).not_to be_empty
                expect((json)['lengths'].count).to eql(10)
                expect(response).to have_http_status(200)
            end
        end
    end
    describe 'List all Widths' do
        # valid payload
        context 'success' do
        
        before { get '/api/v1/meta/widths', headers: headers[:auth], as: :json }
        
            it 'returns token' do
                # Note `json` is a custom helper to parse JSON responses
                expect(json).not_to be_empty
                expect((json)['widths'].count).to eql(10)
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'List all Provinces' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/provinces', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['provinces'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Cities under a province' do
        # valid payload
            context 'success' do
    
            before { get "/api/v1/meta/cities?province_id=#{provinces.first.id}", headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['cities'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all Container Types' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/container_types', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['container_types'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end

    describe 'List all yards' do
        # valid payload
            context 'success' do
    
            before { get '/api/v1/meta/yards', headers: headers[:auth], as: :json }
    
                it 'returns token' do
                    # Note `json` is a custom helper to parse JSON responses
                    expect(json).not_to be_empty
                    expect((json)['yards'].count).to eql(10)
                    expect(response).to have_http_status(200)
                end
            end
        end
    
end