Rails.application.routes.draw do
  use_doorkeeper
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :items, except: [:new, :edit]

      namespace :meta do
        resources :repair_types, only: [:index]
        resources :container_repair_areas, only: [:index]
        resources :container_damaged_areas, only: [:index]
        resources :reps, only: [:index]
        resources :dams, only: [:index]
        resources :events, only: [:index]
        resources :comps, only: [:index]
        resources :mode_numbers, only: [:index]
        resources :repair_modes, only: [:index]
        resources :units, only: [:index]
        resources :components, only: [:index]
        resources :reps, only: [:index]
      end

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
