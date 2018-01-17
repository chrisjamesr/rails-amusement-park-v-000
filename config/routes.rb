Rails.application.routes.draw do


  root 'attractions#index' 

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  

end