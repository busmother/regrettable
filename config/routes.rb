Rails.application.routes.draw do
  resources :apologies
  resources :incidents
  resources :users, only: [:show]
  # devise_for :users

  root to: "home#index"

  devise_for :users, skip: [:sessions] 
  as :user do
    get '/signup', to: 'devise/registrations#new', as: :new_user
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    get 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  #here we're sending a put request with the id of the apology we want to forgive and we are calling our forgive method in our controller
  get '/apology/:id/forgiveness', to: 'apologies#forgive', as: 'forgiveness'
  delete '/apology/:id/forgiveness', to: 'apologies#unforgive'

end
