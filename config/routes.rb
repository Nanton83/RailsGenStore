Rails.application.routes.draw do
  
  
  root 'application#home'

   get '/login' => 'sessions#new'
   post '/sessions' => 'sessions#create'
   get '/signout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :users, only: [:new, :create, :show]
  resources :items, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
end
