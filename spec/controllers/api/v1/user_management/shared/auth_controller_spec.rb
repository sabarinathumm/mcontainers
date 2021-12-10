require 'rails_helper'

RSpec.describe 'Shared::Auth:', type: :request do
  # initialize test data 
  let!(:admin){ create(:admin) }
  let!(:admin_headers) { get_admin_headers(admin) }

  # Test suite for POST /api/v1/user_management/user/auth/login
  describe 'Login' do
    # valid payload
    context '(success - Admin login by email and password)' do

      let(:valid_attributes) { 
        { 
            email: admin.email,
            password: "Password@123",
            grant_type: "password"
        }
      }

      before { post '/api/v1/user_management/shared/auth/login', params: valid_attributes, as: :json }

      it 'returns token' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['user']).not_to be_empty
        expect(json["token"]).not_to be_empty
        expect(json['user']['user_type']).to eql('Admin')
        expect(response).to have_http_status(201)
      end
    end

    # valid payload
    context '(success - Admin login by refresh token)' do

      let(:valid_attributes) { 
        { 

            grant_type: "refresh_token",
            refresh_token: admin_headers[:other]["refresh-token"]
        }
      }

      before { post '/api/v1/user_management/shared/auth/login', params: valid_attributes, as: :json }

      it 'returns token' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['user']).not_to be_empty
        expect(json["token"]).not_to be_empty
        expect(json['user']['user_type']).to eql('Admin')
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for DELETE /api/v1/user_management/user/auth/logout
  describe 'Logout' do
    # valid payload
    context '(success)' do
      let!(:headers1) { get_admin_headers(admin) }

      before { delete '/api/v1/user_management/shared/auth/logout', headers: headers1[:auth] }

      it 'returns empty' do
        # Note `json` is a custom helper to parse JSON responses
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for POST /api/v1/user_management/user/auth/forgot_password
  describe 'Forgot Password' do
    let!(:admin1){ create(:admin) }

    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { 
 
            email: admin1.email
        }
      }

      before { post '/api/v1/user_management/shared/auth/forgot_password', params: valid_attributes, as: :json }

      it 'returns success message' do
        record = Admin.find_by(id: admin1.id)

        expect(response).to have_http_status(201)
        expect(record.reset_password_token.blank?).not_to be_truthy
        expect(ActionMailer::Base.deliveries.count).to eql(1)
        expect(ActionMailer::Base.deliveries.last.subject).to eql('Reset Password')
      end
    end

    # valid payload
    context '(User not found)' do

      let(:valid_attributes) { 
        { 
  
            email: "notfound@mail.com"
        }
      }

      before { post '/api/v1/user_management/shared/auth/forgot_password', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
        expect(ActionMailer::Base.deliveries.count).to eql(0)
      end
    end
  end

  # Test suite for POST /api/v1/user_management/user/auth/validate_reset_password_token
  describe 'Validate Reset Password Token' do
    let!(:admin){ create(:admin, reset_password_token: "11111", reset_password_sent_at: Time.now) }

    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { 
            email: admin.email,
            reset_password_token: admin.reset_password_token
        }
      }

      before { post '/api/v1/user_management/shared/auth/validate_reset_password_token', params: valid_attributes, as: :json }

      it 'returns success message' do
        expect(response).to have_http_status(200)
      end
    end

    # invalid payload
    context '(reset password token is expired error)' do

      let(:valid_attributes) { 
        { 

            email: admin.email,
            reset_password_token: admin.reset_password_token
        }
      }

      before { 
        admin.update(reset_password_sent_at: Time.now - 20.minutes )
        post '/api/v1/user_management/shared/auth/validate_reset_password_token', params: valid_attributes, as: :json 
      }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end

    # invalid payload
    context '(User not found error)' do

      let(:valid_attributes) { 
        { 
            email: "notfound@mail.com",
            reset_password_token: admin.reset_password_token
        }
      }

      before { post '/api/v1/user_management/shared/auth/validate_reset_password_token', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for POST /api/v1/user_management/user/auth/password
  describe 'Reset password' do
    let!(:admin){ create(:admin, reset_password_token: "122334445543223", reset_password_sent_at: Time.now) }

    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { 

            email: admin.email,
            reset_password_token: admin.reset_password_token,
            new_password: "Password@1234"
        }
      }

      before { put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json }

      it 'returns success message' do
        admin = Admin.find(json['user']['id'])
        expect(response).to have_http_status(200)
        expect(Admin.authenticate(admin.email, "Password@1234").blank?).not_to be_truthy
      end
    end

    # invalid payload
    context '(password invalid error)' do

      let(:valid_attributes) { 
        { 

            email: admin.email,
            reset_password_token: admin.reset_password_token,
            new_password: "password"
        }
      }

      before { put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end

    # invalid payload
    context '(user not found error)' do

      let(:valid_attributes) { 
        { 
            email: "notfound@mail.com",
            reset_password_token: admin.reset_password_token,
            new_password: "Password@1234"
        }
      }

      before { put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end

    # invalid payload
    context '(reset password token expired error)' do

      let(:valid_attributes) { 
        { 

            email: admin.email,
            reset_password_token: admin.reset_password_token,
            new_password: "Password@1234"
        }
      }

      before { 
        admin.update(reset_password_sent_at: Time.now - 20.minutes )
        put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json 
      }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end
  end

  let!(:customer){ create(:customer) }
  let!(:headers) { get_customer_headers(customer) }

  # Test suite for POST /api/v1/user_management/user/auth/login
  describe 'Login' do
    # valid payload
    context '(success - Customer login by email and password)' do

      let(:valid_attributes) { 
        { 
            email: customer.email,
            password: "Password@123",
            grant_type: "password"
        }
      }

      before { post '/api/v1/user_management/shared/auth/login', params: valid_attributes, as: :json }

      it 'returns token' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['user']).not_to be_empty
        expect(json["token"]).not_to be_empty
        expect(json['user']['user_type']).to eql('Customer')
        expect(response).to have_http_status(201)
      end
    end

    # valid payload
    context '(success - Customer login by refresh token)' do

      let(:valid_attributes) { 
        { 

            grant_type: "refresh_token",
            refresh_token: headers[:other]["refresh-token"]
        }
      }

      before { post '/api/v1/user_management/shared/auth/login', params: valid_attributes, as: :json }

      it 'returns token' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['user']).not_to be_empty
        expect(json["token"]).not_to be_empty
        expect(json['user']['user_type']).to eql('Customer')
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for DELETE /api/v1/user_management/user/auth/logout
  describe 'Logout' do
    # valid payload
    context '(success)' do
      let!(:headers1) { get_customer_headers(customer) }

      before { delete '/api/v1/user_management/shared/auth/logout', headers: headers1[:auth] }

      it 'returns empty' do
        # Note `json` is a custom helper to parse JSON responses
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for POST /api/v1/user_management/user/auth/forgot_password
  describe 'Forgot Password' do
    let!(:customer1){ create(:customer) }

    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { 
 
            email: customer1.email
        }
      }

      before { post '/api/v1/user_management/shared/auth/forgot_password', params: valid_attributes, as: :json }

      it 'returns success message' do
        record = Customer.find_by(id: customer1.id)

        expect(response).to have_http_status(201)
        expect(record.reset_password_token.blank?).not_to be_truthy
        expect(ActionMailer::Base.deliveries.count).to eql(1)
        expect(ActionMailer::Base.deliveries.last.subject).to eql('Reset Password')
      end
    end

    # valid payload
    context '(User not found)' do

      let(:valid_attributes) { 
        { 
  
            email: "notfound@mail.com"
        }
      }

      before { post '/api/v1/user_management/shared/auth/forgot_password', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
        expect(ActionMailer::Base.deliveries.count).to eql(0)
      end
    end
  end

  # Test suite for POST /api/v1/user_management/user/auth/validate_reset_password_token
  describe 'Validate Reset Password Token' do
    let!(:customer){ create(:customer, reset_password_token: "11111", reset_password_sent_at: Time.now) }

    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { 
            email: customer.email,
            reset_password_token: customer.reset_password_token
        }
      }

      before { post '/api/v1/user_management/shared/auth/validate_reset_password_token', params: valid_attributes, as: :json }

      it 'returns success message' do
        expect(response).to have_http_status(200)
      end
    end

    # invalid payload
    context '(reset password token is expired error)' do

      let(:valid_attributes) { 
        { 

            email: customer.email,
            reset_password_token: customer.reset_password_token
        }
      }

      before { 
        customer.update(reset_password_sent_at: Time.now - 20.minutes )
        post '/api/v1/user_management/shared/auth/validate_reset_password_token', params: valid_attributes, as: :json 
      }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end

    # invalid payload
    context '(User not found error)' do

      let(:valid_attributes) { 
        { 
            email: "notfound@mail.com",
            reset_password_token: customer.reset_password_token
        }
      }

      before { post '/api/v1/user_management/shared/auth/validate_reset_password_token', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for POST /api/v1/user_management/user/auth/password
  describe 'Reset password' do
    let!(:customer){ create(:customer, reset_password_token: "122334445543223", reset_password_sent_at: Time.now) }

    # valid payload
    context '(success)' do

      let(:valid_attributes) { 
        { 

            email: customer.email,
            reset_password_token: customer.reset_password_token,
            new_password: "Password@1234"
        }
      }

      before { put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json }

      it 'returns success message' do
        customer = Customer.find(json['user']['id'])
        expect(response).to have_http_status(200)
        expect(Customer.authenticate(customer.email, "Password@1234").blank?).not_to be_truthy
      end
    end

    # invalid payload
    context '(password invalid error)' do

      let(:valid_attributes) { 
        { 

            email: customer.email,
            reset_password_token: customer.reset_password_token,
            new_password: "password"
        }
      }

      before { put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end

    # invalid payload
    context '(user not found error)' do

      let(:valid_attributes) { 
        { 
            email: "notfound@mail.com",
            reset_password_token: customer.reset_password_token,
            new_password: "Password@1234"
        }
      }

      before { put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end

    # invalid payload
    context '(reset password token expired error)' do

      let(:valid_attributes) { 
        { 

            email: customer.email,
            reset_password_token: customer.reset_password_token,
            new_password: "Password@1234"
        }
      }

      before { 
        customer.update(reset_password_sent_at: Time.now - 20.minutes )
        put '/api/v1/user_management/shared/auth/reset_password', params: valid_attributes, as: :json 
      }

      it 'returns error' do
        expect(response).to have_http_status(422)
      end
    end
  end

end
