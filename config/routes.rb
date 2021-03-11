Rails.application.routes.draw do
  resources :apologies
  resources :incidents
  resources :users
  devise_for :users

  root to: "home#index"

  # get '/signup' => 'users#new'
  
  # devise_scope :user do #what does this do? anything?
  #   get 'sign_in', to: 'devise/sessions#new'
  # end

  #here we're sending a put request with the id of the apology we want to forgive and we are calling our forgive method in our controller
  put '/apology/:id/forgiveness', to: 'apologies#forgive', as: 'forgiveness'

end
