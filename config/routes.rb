Rails.application.routes.draw do


  root 'welcome#home'

  get 'attractions/index' => 'attractions#index'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, :only => [:new, :create, :show] 
  
  

end