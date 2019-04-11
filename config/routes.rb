# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :orders

  resources :products
  root to: 'products#index'

  resources :categories
  root to: 'categories#index'

  resource :cart, only: [:show]

  resources :order_products, only: %i[create update destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :customer do
    get '/sign_in' => 'devise/sessions#new' # custom path to login/sign_in
    get '/sign_up' => 'devise/registrations#new', as: 'new_user_registration' # custom path to sign_up/registration
  end

  devise_for :customers

  resources :customers

  resources :charges

  get '/:name', to: 'pages#show', as: 'page'
end
