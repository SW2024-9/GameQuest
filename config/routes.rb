Rails.application.routes.draw do
  resources :users
<<<<<<< HEAD
  resources :tweets
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  root 'top#main'
  
  resources :likes
=======
  root 'users#index'
>>>>>>> bb0a7aa0706dd33b304a56d3834bff04f33b7754
end
