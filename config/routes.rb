Rails.application.routes.draw do
  #devise_for :customers
  use_doorkeeper
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :items, except: [:new, :edit]

      
      namespace :activity_management do
        namespace :admin do
          resources :activities, only: [:index, :update, :show, :delete]
          get 'activities',  to: 'activities#index'
          post 'activities/update_status',  to: 'activities#update_status'
          post 'activities_export',  to: 'activities#export'
          get 'container_activities', to:'activities#container_activity'
          get 'activities', to: 'activities#show'
          delete 'activities/:id', to: 'activities#delete'
          post 'activities', to: 'activities#create'
          put 'activities/:id',  to: 'activities#update'
          post 'activities/update_date',  to: 'activities#update_date'
          post 'activities/auto_populate',  to: 'activities#auto_populate'
          post 'activity_statuses',  to: 'activities#activity_status'
          post 'activities/auto_populate_damage_area',  to: 'activities#auto_populate_damage_area'
          post 'activities/auto_populate_repair_type',  to: 'activities#auto_populate_repair_type'
          post 'activities/auto_populate_length',  to: 'activities#auto_populate_length'
          post 'activities/auto_populate_width',  to: 'activities#auto_populate_width'
          post 'activities/auto_populate_unit',  to: 'activities#auto_populate_unit'
          post 'activities/auto_populate_all',  to: 'activities#auto_populate_all'
          scope "activities/:activity_id" do
            resources :activity_items, only: [:index, :create ,:update, :show]
            delete "activity_items/:id", to: 'activity_items#delete'
          end
          
        end

      

        namespace :employee do
          resources :activities, only: [:index, :update, :show, :delete]
          get 'activities',  to: 'activities#index'
          post 'activities/update_status',  to: 'activities#update_status'
          post 'activities_export',  to: 'activities#export'
          get 'container_activities', to:'activities#container_activity'
          get 'activities', to: 'activities#show'
          delete 'activities/:id', to: 'activities#delete'
          post 'activities', to: 'activities#create'
          put 'activities/:id',  to: 'activities#update'
          post 'activities/update_date',  to: 'activities#update_date'
          post 'activities/auto_populate',  to: 'activities#auto_populate'
          post 'activity_statuses',  to: 'activities#activity_status'
          post 'activities/auto_populate_damage_area',  to: 'activities#auto_populate_damage_area'
          post 'activities/auto_populate_repair_type',  to: 'activities#auto_populate_repair_type'
          post 'activities/auto_populate_length',  to: 'activities#auto_populate_length'
          post 'activities/auto_populate_width',  to: 'activities#auto_populate_width'
          post 'activities/auto_populate_unit',  to: 'activities#auto_populate_unit'
          post 'activities/auto_populate_all',  to: 'activities#auto_populate_all'

          scope "activities/:activity_id" do
            resources :activity_items, only: [:index, :create ,:update, :show]
            delete "activity_items/:id", to: 'activity_items#delete'
          end
        end

      end

      namespace :invoice_management do
        # resources :activities, only: [:index, :show]
        namespace :admin do 
          get 'invoices', to: 'invoices#index'
          get 'invoices', to: 'invoices#invoice_history'
          post 'invoices/export', to: 'invoices#export_common' 
          get 'invoices/:id', to: 'invoices#show'
          post 'invoices', to: 'invoices#create' 
        end
      end
      
      namespace :container_management do
        namespace :admin do
          resources :containers, only: [:index, :create, :update, :show]
          post 'containers/validate_container', to: "containers#validate_container"
          scope "containers/:id" do
            get 'download', to: 'containers#download'
          end
        end

        namespace :employee do
          resources :containers, only: [:index, :create, :update, :show]
          post 'containers/validate_container', to: "conatiners#validate_container"
          scope "containers/:id" do
            get 'download', to: 'containers#download'
          end
        end
      end

      namespace :file_management do
        post 'uploaded_files', to: "uploaded_files#create"
      end

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
        resources :provinces, only: [:index]
        resources :cities, only: [:index]
        resources :container_types, only: [:index]
        resources :yards, only: [:index]
        resources :lengths, only: [:index]
        resources :widths, only: [:index]
        resources :container_lengths, only: [:index]
        resources :container_heights, only: [:index]
      end

      namespace :repair_list_management do
        namespace :admin do
          get 'repair_list',  to: 'repair_lists#index'
          post 'repair_list', to: 'repair_lists#create'
          put 'repair_list/version_activation/:id', to: 'repair_lists#version_activation'
          scope "/repair_list/:repair_list_id" do
            get 'items',  to: 'repair_list_items#index'
            post 'items', to: 'repair_list_items#create'
            get 'items/export', to: 'repair_list_items#export'
            post 'items/upload', to: 'repair_list_items#upload'
          end

          get 'customer_repair_list',  to: 'customer_repair_lists#index'
          post 'customer_repair_list', to: 'customer_repair_lists#create'
          put 'customer_repair_list/version_activation/:id', to: 'customer_repair_lists#version_activation'

          scope "/customer_repair_list/:customer_repair_list_id" do
            get 'items',  to: 'customer_repair_list_items#index'
            post 'items', to: 'customer_repair_list_items#create'
            get 'items/export', to: 'customer_repair_list_items#export'
            post 'items/upload', to: 'customer_repair_list_items#upload'
          end

          scope "/customer_repair_list/" do 
            get "items/:id",  to: 'customer_repair_list_items#show'
            put "items/:id", to: 'customer_repair_list_items#update'
            delete "items/:id",  to: 'customer_repair_list_items#delete'
          end

          scope "/repair_list/" do 
            get "items/:id",  to: 'repair_list_items#show'
            put "items/:id", to: 'repair_list_items#update'
            delete "items/:id",  to: 'repair_list_items#delete'
          end
        end

        namespace :shared do
          get 'all_customer_lists',  to: 'repair_lists#all_customer_lists'
        end
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
          resources :customers, only: [:index, :update, :create, :show]
          get 'all_customers', to: 'customers#all_customers'
        end

        namespace :employee do
          delete 'auth/logout'
          post 'auth/login'
          post 'auth/forgot_password'
          post 'auth/validate_reset_password_token'
          put 'auth/reset_password'
          resources :customers, only: [:index, :update, :create, :show]
          get 'all_customers', to: 'customers#all_customers'
        end

        namespace :customer do
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
