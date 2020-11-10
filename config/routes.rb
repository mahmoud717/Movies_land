Rails.application.routes.draw do
  resources :articles
  resources :users
  resources :categories
  get "signup", to: "users#new"
  get "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create" 
  root to: "articles#index"
end
