Rails.application.routes.draw do

  # get 'home/index'
  resources :forgivenesses
  resources :apologies
  resources :incidents
  # resources :users
  devise_for :users
  # get 'home/index'
  root to: "home#index"
  # root to: "apologies#index"

  

  get '/signup' => 'users#new'
  # get 'users/sign_out' => 'devise/sessions#destroy'
  # @request.env["devise.mapping"] = Devise.mappings[:user]
  
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

end
