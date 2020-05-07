Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  get 'pages/index'
  get 'pages/dashboard'
  #get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')


  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', :controllers => {
          passwords: 'api/v1/passwords',
          registrations: 'api/v1/registrations',
          sessions: 'api/v1/sessions'
      }
      resources :settings
    end
  end

  root 'pages#index'
end
