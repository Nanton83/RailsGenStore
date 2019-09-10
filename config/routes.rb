Rails.application.routes.draw do
  
  
  resources :stores
  root 'application#home'

   get '/login' => 'sessions#new'
   post '/sessions' => 'sessions#create'
   get '/signout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :users, only: [:new, :create, :show]
  resources :items
  resources :sessions, only: [:new, :create, :destroy]
  
end
