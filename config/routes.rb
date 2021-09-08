Rails.application.routes.draw do
  use_doorkeeper
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :items, except: [:new, :edit]

      namespace :user_management do
        namespace :user do
          delete 'auth/logout'
          post 'auth/login'
          post 'auth/forgot_password'
          post 'auth/validate_reset_password_token'
          put 'auth/password'
        end

        namespace :admin do
          delete 'auth/logout'
          post 'auth/login'
          post 'auth/forgot_password'
          post 'auth/validate_reset_password_token'
          put 'auth/reset_password'
        end
      end
  	end
  end

end
