class AdminMailer < ApplicationMailer

	def send_reset_password_link(admin, url)
		@admin = admin
		@url = url
		mail(to: @admin.email, subject: "Reset Password")
	end
end
