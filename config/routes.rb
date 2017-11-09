Rails.application.routes.draw do

  devise_for :admins
  # get 'welcome/index'
  root 'welcome#index'
  get 'welcome/about', as: '/about'
  get 'welcome/faq', as: '/faq'
  devise_for :admins, only: [path_names: { admin_sign_in: 'admin login', admin_sign_out: 'admin logout', admin_sign_up: 'admin signup' }]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  
  get '/support' => 'support#new'
  post '/support' => 'support#create'
  
  devise_for :users, controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # resources :users, only: [:show, :update], controller: :profiles
  # get 'profiles/:id' => 'profiles#show', as: 'profile'
  resource :profile
  resources :items 
  
  resources :repairers
  resources :repairs, only: [:index, :show, :new, :create] do
    resources :conversations do
      resources :messages
    end
  end
end
