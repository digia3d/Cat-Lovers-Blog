Rails.application.routes.draw do
  routh 'users#index'

  get 'users' to: 'users#index'
  get 'users/:id' to: 'users#show'
  get 'posts/show'
  resources :likes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
