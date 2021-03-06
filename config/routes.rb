Rails.application.routes.draw do
  
  
  
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/items/ordered' => 'items#ordered'

  resources :stores do
    resources :items
  end
  
  # resources :distributors do 
  #   resources :stores
  # end

  resources :items

  resources :distributors, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]
  
  resources :stores
end

# Hi @Nanton! It sounds like a good case for 
# a nested route. If the route is 
# new_store_item_path(@store), you will get a url 
# like: '/stores/:store_id/items/new' and then 
# you can use that store_id when creating the item