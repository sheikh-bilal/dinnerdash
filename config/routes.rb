Rails.application.routes.draw do
  get 'bill/show'
  devise_for :users
  get "home/index"
  resources :items
  resources :categories
  resources :users
  resources :order_items
  resource :bills, only:[:show]
  delete "users/:id", to: "users#destroy"
  root "home#index"
end
