Rails.application.routes.draw do
  get 'carts/show'
  get 'cartitems/new'
  get 'products/index'
  get 'products/new'
  resources :users
  resources :products
  resources :cartitems, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
  
  resources :images
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  
  root 'top#main'
  
  resources :likes
end
