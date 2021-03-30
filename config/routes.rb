# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :items
  resources :categories
  resources :users
  resources :order_items
  resources :orders
  resources :cart_items
  resources :carts
  delete 'users/:id', to: 'users#destroy'
  root 'home#index'
end
