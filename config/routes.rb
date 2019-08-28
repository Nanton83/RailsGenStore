Rails.application.routes.draw do
  resources :users
  
  get '/signin' => 'sessions#sign_in'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
