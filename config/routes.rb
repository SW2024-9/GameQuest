Rails.application.routes.draw do
  resources :users
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  root 'top#main'
  
end
