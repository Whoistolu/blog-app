Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  root to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
