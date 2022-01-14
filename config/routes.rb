Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  root to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
