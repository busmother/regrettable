Rails.application.routes.draw do

  # get 'home/index'
  # resources :forgivenesses
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
  
  devise_scope :user do #what does this do? anything?
    get 'sign_in', to: 'devise/sessions#new'
  end

  #here we're sending a put request with the id of the apology we want to forgive and we are calling our forgive method in our controller
  put '/apology/:id/forgiveness', to: 'apologies#forgive', as: 'forgiveness'

end
