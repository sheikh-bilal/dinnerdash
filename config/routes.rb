# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :items
  resources :categories
  resources :users
  resource :order_items, only: [:create]
  resources :orders, only: [:index, :edit, :show, :update]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :carts, only: [:index, :destroy]
  delete 'users/:id', to: 'users#destroy'
  root 'home#index'
end
