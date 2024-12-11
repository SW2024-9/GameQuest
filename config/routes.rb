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

  
  root 'top#index'
  
  
#12/4変更箇所
#################################################################
  post "/top/login", to: "sessions#create"  # ログイン処理
  get "/main", to: "main#index"  # メインページ
<<<<<<< HEAD

#検索
  get "search" => "searches#search"

#12/11ログアウト用
delete '/logout', to: 'sessions#destroy', as: :logout
################################################################
  
  
  
  resources :likes
=======
####################################################### 
  get 'get_image/:id', to: 'products#get_image'

>>>>>>> 851a04508f6c1b6e1b9edfc8aed3844665ecafb6
end
