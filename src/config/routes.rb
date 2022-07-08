Rails.application.routes.draw do
  resources :messages

  get 'products/myproducts', to: 'products#my_products', as: "my_products"
  get 'products/myorders', to: 'products#my_orders', as: "my_orders"

  resources :products
  devise_for :users
  root 'pages#home'
  get 'pages/guide'
  post "products/:id/order", to: "products#place_order", as: "place_order"
  get 'pages/success', to: 'pages#success', as: "order_success"
  post "messages/:id/reply", to: "messages#place_reply", as: "place_reply"
 

  mount ActiveStorageDB::Engine => '/active_storage_db'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
