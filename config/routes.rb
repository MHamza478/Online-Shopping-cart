# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/create'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'carts/show'
  resources :order_items, only: [:create, :destroy]
  resource :order, only: [:create]
  resource :carts, only: %i[show destroy]
  resource :home, only: [:index]
  root 'home#index'
end
