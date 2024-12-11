Rails.application.routes.draw do
  get 'carts/show'
  get 'cartitems/new'
  get 'products/index'
  get 'products/new'
  resources :users
  resources :products
  resources :cartitems, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
  
  post 'top/login'  
  get 'top/main'
  get 'top/logout'

  
  root 'top#main'
  
  
#12/4変更箇所
#################################################################
  post "/top/login", to: "sessions#create"  # ログイン処理
  get "/main", to: "main#index"  # メインページ
####################################################### 
  get 'get_image/:id', to: 'products#get_image'

end
