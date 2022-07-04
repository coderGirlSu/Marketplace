Rails.application.routes.draw do
  resources :messages
  resources :products
  devise_for :users
  root 'pages#home'
  get 'pages/guide'
  post "products/:id/order", to: "products#place_order", as: "place_order"
  get 'pages/success', to: 'pages#success', as: "order_success"
  mount ActiveStorageDB::Engine => '/active_storage_db'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
