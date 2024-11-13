Rails.application.routes.draw do
  resources :users
<<<<<<< HEAD
  #resources :tweets
=======
>>>>>>> ec818a21e9d89cd16303828c44391370c3688e0b
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  root 'top#main'
  
<<<<<<< HEAD
  resources :likes
=======
>>>>>>> ec818a21e9d89cd16303828c44391370c3688e0b
end
