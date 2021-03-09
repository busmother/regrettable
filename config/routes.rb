Rails.application.routes.draw do

  # get 'home/index'
  resources :forgivenesses
  resources :apologies
  resources :incidents
  devise_for :users
  # get 'home/index'
  root to: "home#index"
  # root to: "apologies#index"


end
