Rails.application.routes.draw do
  
  resources :transferences
  devise_for :users 
  get "/users/:id", to: "users#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#show"
end
