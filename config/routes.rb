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
  


end
