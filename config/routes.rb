Rails.application.routes.draw do

  # get 'welcome/index'
  root 'welcome#index'
  get 'welcome/about', as: '/about'
  get 'welcome/faq', as: '/faq'
  resources :addresses
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  
  get '/support' => 'support#new'
  post '/support' => 'support#create'
  
  devise_for :users
  # resources :users, only: [:show, :update], controller: :profiles
  # get 'profiles/:id' => 'profiles#show', as: 'profile'
  resource :profile
  resources :items
  resources :repairers
  resources :repairs, only: [:index, :show, :new, :create]
  # Set home page to login
  # devise_scope :user do
  #   authenticated :user do
  #     root 'home#index', as: :authenticated_root
  #   end

  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
