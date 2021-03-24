Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  resources :items
  resources :categories
  resources :users
  resources :order_items
  resources :orders
  resources :cart_items
  resources :carts
  resource :bills, only:[:show]
  delete "users/:id", to: "users#destroy"
  root "home#index"
end
