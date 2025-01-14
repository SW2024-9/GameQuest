Rails.application.routes.draw do
  get 'carts/show'
  get 'cartitems/new'
  get 'products/index'
  get 'products/new'
  resources :users, only: [:new, :create, :show]
  resources :products
  resources :cartitems, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
  
  post 'top/login'
  #1/15
  
  get 'top/main', to: 'top#main', as: 'top_main'
  get 'top/logout', to: 'top#logout', as: 'top_logout'
  
  
  get 'get_image/:id', to: 'products#get_image'
  
  root 'top#index'
  
  
#12/4変更箇所
#################################################################
  post "/top/login", to: "sessions#create"  # ログイン処理
  get "/main", to: "main#index"  # メインページ

#検索
  get "search" => "searches#search"

#12/11ログアウト用
delete '/logout', to: 'sessions#destroy', as: :logout
################################################################
  
  
  
  resources :likes
end
