Rails.application.routes.draw do
  
  root 'application#home'
  resources :users
  
  get '/signin' => 'sessions#sign_in'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
