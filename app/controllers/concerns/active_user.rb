module ActiveUser
  
    def generate_refresh_token
      loop do
            token = SecureRandom.hex(32)
            break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
        end
    end 
end
  