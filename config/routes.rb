Rails.application.routes.draw do
  # get 'welcome/index'
  root 'welcome#index'
  resources :addresses
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  resources :users, only: [:show, :update], controller: :profiles
  # get 'profiles/:id' => 'profiles#show', as: 'profile'
  resource :profile
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
