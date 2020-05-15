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
        resources :countries
        resources :settings
        resources :users, only: [:index,:update]
        resources :user_accounts

        resources :platform_originators
        # resources :originators do
        #   resources :platform_originators
        # end

        resources :user_platforms


        match 'user_profile', to: 'users#user_profile', via: :get
        match 'update_profile', to: 'users#update_profile', via: :post
      end
    end
  end

  root 'pages#index'
end
