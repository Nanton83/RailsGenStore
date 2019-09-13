Rails.application.routes.draw do
  
  
  
  root 'application#home'

   get '/login' => 'sessions#new'
   post '/sessions' => 'sessions#create'
   get '/signout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :distributors, only: [:new, :create, :show]
  resources :items
  resources :sessions, only: [:new, :create, :destroy]
  resources :stores
  
end
