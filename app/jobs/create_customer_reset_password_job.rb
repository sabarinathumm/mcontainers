class CreateCustomerResetPasswordJob < ApplicationJob
    queue_as :default
  
    def perform(customer, redirect_url)
        begin
              if Rails.env.development? or Rails.env.test?
                customer.reset_password_token = "111111"
              else
                customer.reset_password_token = rand(10 ** 6)
              end
            
            customer.reset_password_sent_at = Time.now
            url = redirect_url.to_s+'?'+"email=#{customer.email}&reset_password_token=#{customer.reset_password_token}"
  
            if customer.save
                CustomerMailer.send_reset_password_link(customer, url).deliver_now
                return customer
            else
                raise Exception.new "Password reset link not sent" if customer.blank?
            end
        rescue Exception => e
              puts e.message
        end
    end
end
  