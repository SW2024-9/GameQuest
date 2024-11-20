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
  
  
  
#Topページ
#################################################################
  #root 'top#login' # ログインページをルートに設定

  # セッション管理
  #get '/login', to: 'top#login'
  #post '/create_session', to: 'top#create_session'
  #delete '/logout', to: 'top#logout'

  # メインページ
  #get '/main', to: 'top#main'

  # サンプル: 検索や欲しいものリストなどのパス
  #get '/search', to: 'search#index'
  #get '/wishlist', to: 'wishlist#index'
  #get '/listings/new', to: 'listings#new'
####################################################### 
  
  
  
  resources :likes
end
