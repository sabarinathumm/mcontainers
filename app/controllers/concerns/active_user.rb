module ActiveUser
  
    def generate_refresh_token
      loop do
            token = SecureRandom.hex(32)
            break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
        end
    end

    def validate_user!
        throw_error("Unauthorized.", 401) unless doorkeeper_token.scopes.to_s == "user"
    
        user = User.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
        throw_error("Unauthorized.", 401) if user.blank?
    
        throw_error("Session expired.", 401) if ((Time.now - doorkeeper_token.created_at) / 86400) > Rails.application.secrets.user_active_session_duration
    end
    
    def current_user
        User.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
    end

    def validate_admin!
        throw_error("Unauthorized.", 401) unless doorkeeper_token.scopes.to_s == "admin"
    
        admin = Admin.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
        throw_error("Unauthorized.", 401) if admin.blank?
    
        throw_error("Session expired.", 401) if ((Time.now - doorkeeper_token.created_at) / 86400) > Rails.application.secrets.user_active_session_duration
    end
    
    def current_admin
        Admin.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
    end

    def validate_customer!
        throw_error("Unauthorized.", 401) unless doorkeeper_token.scopes.to_s == "customer"
    
        customer = Customer.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
        throw_error("Unauthorized.", 401) if customer.blank?
    
        throw_error("Session expired.", 401) if ((Time.now - doorkeeper_token.created_at) / 86400) > Rails.application.secrets.user_active_session_duration
    end
    
    def current_customer
        Customer.find_by(id: doorkeeper_token.resource_owner_id) unless doorkeeper_token.blank?
    end
    
    def validate_token!
        throw_error("Session expired.", 401) if ((Time.now - doorkeeper_token.created_at) / 86400) > Rails.application.secrets.user_active_session_duration
    end

    def current_user_obj
        if doorkeeper_token.present? 
          return Admin.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token.scopes.to_s == 'admin'
          return Customer.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token.scopes.to_s == 'customer'
        end
    end
end
  