Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root  "home#index"
  get "store", to: "store#index"  , as: :store
  get "product", to: "product#index"
  get "sign_up", to: "registration#new"
  post "sign_up" ,  to: "registration#create"
  
  delete "logout" ,  to: "sessions#destroy"
  get "log_in", to: "sessions#new" 
  post "log_in" ,  to: "sessions#create" 
end
