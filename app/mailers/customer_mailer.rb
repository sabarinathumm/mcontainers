class CustomerMailer < ApplicationMailer

	def send_reset_password_link(customer, url)
		@customer = customer
		@url = url
		mail(to: @customer.email, subject: "Reset Password")
	end
end
