class UserMailer < ApplicationMailer

	def send_reset_password_link(user)
		@user = user
		mail(to: @user.email, subject: "Reset Password")
	end
end
