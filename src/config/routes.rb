Rails.application.routes.draw do
  resources :products
  devise_for :users
  root 'pages#home'
  get 'pages/guide'
  post "products/:id/order", to: "products#place_order", as: "place_order"
  get 'pages/success', to: 'pages#success', as:"order_success"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
