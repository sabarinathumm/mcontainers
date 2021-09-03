class CreateUserResetPasswordJob < ApplicationJob
    queue_as :default
  
    def perform(user)
        begin
              if Rails.env.development? or Rails.env.test?
                user.reset_password_token = "111111"
              else
                user.reset_password_token = rand(10 ** 6)
              end
            
            user.reset_password_sent_at = Time.now
  
            if user.save
                UserMailer.send_reset_password_link(user).deliver_now
                return user
            else
                raise Exception.new "Password reset link not sent" if user.blank?
            end
        rescue Exception => e
              puts e.message
        end
    end
end
  