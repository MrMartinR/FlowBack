Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/dashboard'
 
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', :controllers => {
          passwords: 'api/v1/passwords',
          registrations: 'api/v1/registrations',
          sessions: 'api/v1/sessions'
      }

      defaults format: :json do
        resources :accounts
        resources :currencies
        resources :modify_countries
        resources :modify_currencies
        resources :countries
        resources :settings
        resources :image_assets, :path => '/icons', only: [:index, :create, :update]
        resources :users, only: [:index,:update]
        resources :user_accounts do
          collection do
            get 'search'
          end
        end
        resources :originators
        resources :platform_originators
        resources :user_platforms
        resources :contacts
        resources :contact_methods
        resources :platforms do
          collection do
            get 'search'
          end
        end
        get '/platforms/:id/platform_originators', to: 'platform_originators#index_by_platform_id'        
        resources :loans
        resources :user_loans do
          collection do
            get 'index_as_admin'
            get 'search'
          end
        end

        resources :transactions
        


        match 'user_profile', to: 'users#user_profile', via: :get
        match 'update_profile', to: 'users#update_profile', via: :post,constraints: { format: 'html' } 
      end
    end
  end
  # routing errors
  #match '*path', to: "errors#handle_root_not_found", via: [:get, :post, :put, :patch]
  get '*path', to: redirect('/'), constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  root 'pages#index'
end
