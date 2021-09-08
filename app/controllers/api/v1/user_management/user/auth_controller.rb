class Api::V1::UserManagement::User::AuthController < Api::V1::BaseController
	before_action :doorkeeper_authorize!, only: :logout
	before_action :validate_user!, only: :logout

	def logout
		doorkeeper_token.destroy
	end

	def login
		if user_params[:grant_type] == "password"

			throw_error("Email or Password is missing.", :unprocessable_entity) if user_params[:email].blank? or user_params[:password].blank?

			@user = User.authenticate(user_params[:email], user_params[:password])
			throw_error("Email or Password is incorrect.", :unprocessable_entity) if @user.blank?

			access_token = Doorkeeper::AccessToken.create(
		   resource_owner_id: @user.id,
		   refresh_token: generate_refresh_token,
		   expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
		   scopes: 'user'
			)

			token = {
				access_token: access_token.token,
				token_type: 'bearer',
				expires_in: access_token.expires_in,
				refresh_token: access_token.refresh_token,
				created_at: access_token.created_at
			}

			user = UserSerializer.new(@user).as_json

			render json: { user: user, token: token } , status: :created

		elsif user_params[:grant_type] == "refresh_token"

			throw_error("Refresh Token is missing.", :unprocessable_entity) if user_params[:refresh_token].blank? 

			access_token = Doorkeeper::AccessToken.find_by(refresh_token: user_params[:refresh_token])
			@user = User.find_by(id: access_token.resource_owner_id)

			throw_error("Token is not valid!.", 401) if @user.blank?
		
			throw_error("Session expired.", 401) if ((Time.now - access_token.created_at) / 86400) > Rails.application.secrets.user_active_session_duration

			access_token.destroy

			new_token = Doorkeeper::AccessToken.create(
		   resource_owner_id: @user.id,
		   refresh_token: user_params[:refresh_token],
		   expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
		   scopes: 'user'
			)

			token =  {
				access_token: new_token.token,
				token_type: 'bearer',
				expires_in: new_token.expires_in,
				refresh_token: new_token.refresh_token,
				created_at: new_token.created_at
			}

			user = UserSerializer.new(@user).as_json

			render json: { user: user, token: token } , status: :created
		end
	end

	def forgot_password
		@user = User.find_by(email: forgot_password_params[:email])
		
		throw_error("User not found.", :unprocessable_entity) if @user.blank?

		CreateUserResetPasswordJob.perform_now(@user)

		render json: { success: "A Verification link has been sent to your email if exists."}, status: :created
	end

	def validate_reset_password_token
		@user = User.find_by(email: validate_reset_password_token_params[:email])
		throw_error("User not found.", :unprocessable_entity) if @user.blank?

		if @user.reset_password_token_valid!(validate_reset_password_token_params[:reset_password_token])
			render json: { success: "Reset Password Token is valid." }, status: :ok
		else
			throw_error("Reset Password Token is wrong or expired.", :unprocessable_entity)
		end
	end

	def password
		@user = User.find_by(email: password_params[:email])
		throw_error("User not found.", :unprocessable_entity) if @user.blank?

		if @user.reset_password_token_valid!(password_params[:reset_password_token])
			
			if @user.update(password: password_params[:new_password])
				render json: @user, serializer: UserSerializer, status: :ok
			else
				throw_error(@user.errors.full_messages, :unprocessable_entity)
			end
		else
			throw_error("Reset Password Token is wrong or expired.", :unprocessable_entity)
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :refresh_token, :grant_type).tap do |user_params|
			user_params.require(:grant_type)
		end
	end

	def forgot_password_params
		params.require(:user).permit(:email, :redirect_url).tap do |forgot_password_params|
			forgot_password_params.require([:email])
		end
	end

	def validate_reset_password_token_params
		params.require(:user).permit(:email, :reset_password_token).tap do |validate_reset_password_token_params|
			validate_reset_password_token_params.require([:email, :reset_password_token])
		end
	end

	def password_params
		params.require(:user).permit(:email, :reset_password_token, :new_password).tap do |password_params|
			password_params.require([:email, :reset_password_token, :new_password])
		end
	end
end
