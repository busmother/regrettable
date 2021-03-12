Rails.application.routes.draw do
  resources :apologies
  resources :incidents
  resources :users, only: [:show]
  # devise_for :users

  root to: "home#index"

 
  # get '/signup' => 'devise/registrations#new'

  devise_for :users, skip: [:sessions] #if you turn this on and turn devise_for :users off, you can at least get sign in
  as :user do
    get '/signup', to: 'devise/registrations#new', as: :new_user
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    get 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
    # delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  #here we're sending a put request with the id of the apology we want to forgive and we are calling our forgive method in our controller
  put '/apology/:id/forgiveness', to: 'apologies#forgive', as: 'forgiveness'

end
