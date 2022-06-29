Rails.application.routes.draw do
  resources :products
  devise_for :users
  root 'pages#home'
  get 'pages/guide'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
