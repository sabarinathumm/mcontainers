class CreateAdminResetPasswordJob < ApplicationJob
    queue_as :default
  
    def perform(admin, redirect_url)
        begin
              if Rails.env.development? or Rails.env.test?
                admin.reset_password_token = "111111"
              else
                admin.reset_password_token = rand(10 ** 6)
              end
            
            admin.reset_password_sent_at = Time.now
            url = redirect_url.to_s+'?'+"email=#{admin.email}&password_reset_token=#{admin.reset_password_token}"
  
            if admin.save
                AdminMailer.send_reset_password_link(admin, url).deliver_now
                return admin
            else
                raise Exception.new "Password reset link not sent" if admin.blank?
            end
        rescue Exception => e
              puts e.message
        end
    end
end
  