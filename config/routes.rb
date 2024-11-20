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
  get 'get_image/:id', to: 'images#get_image'
  
  
  root 'users#new'
  
  resources :likes
end
