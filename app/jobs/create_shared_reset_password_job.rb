class CreateSharedResetPasswordJob < ApplicationJob
    queue_as :default
  
    def perform(user, redirect_url)
        begin
              if Rails.env.development? or Rails.env.test?
                user.reset_password_token = "111111"
              else
                user.reset_password_token = rand(10 ** 6)
              end
            
            user.reset_password_sent_at = Time.now
            url = redirect_url.to_s+'?'+"email=#{user.email}&reset_password_token=#{user.reset_password_token}"
  
            if user.save
                AdminMailer.send_reset_password_link(user, url).deliver_now
                return user
            else
                raise Exception.new "Password reset link not sent" if user.blank?
            end
        rescue Exception => e
              puts e.message
        end
    end
end
  