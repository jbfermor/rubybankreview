Rails.application.routes.draw do
  
  resources :transferences
  devise_for :users 
  unauthenticated :user do
    devise_scope :user do 
      get "/" => "devise/sessions#new"
    end
  end
  get "/users/:id", to: "users#show", as: "home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#show"
end
