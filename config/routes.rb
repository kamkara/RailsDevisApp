Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  root to:"quotes#index"
  resources :quotes

  # Defines the root path route ("/")
  # root "articles#index"
end
