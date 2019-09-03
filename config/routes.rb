Rails.application.routes.draw do
  
  
  root 'application#home'

  get '/signin' => 'sessions#sign_in'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :users
  resources :items
  
end
