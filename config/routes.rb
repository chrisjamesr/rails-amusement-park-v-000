Rails.application.routes.draw do


  post '/rides' => 'rides#create'

  root 'welcome#home'
  resources :attractions, :only => [:index, :show]
  

  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, :only => [:new, :create, :show, :update] 
  
  

end