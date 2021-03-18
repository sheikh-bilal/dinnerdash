Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  resources :items
  resources :categories
  resources :users
  delete "users/:id", to: "users#destroy"
  root "home#index"
end
