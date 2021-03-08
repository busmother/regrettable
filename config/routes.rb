Rails.application.routes.draw do

  resources :forgivenesses
  resources :apologies
  resources :incidents
  devise_for :users
  # get 'home/index'
  root to: "home#index"

end
