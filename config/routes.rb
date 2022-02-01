# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index create new show]
    # Defines the root path route ("/")
  end
  # root "articles#index"
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
end
