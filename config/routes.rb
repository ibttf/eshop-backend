Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :show, :index]
  resources :products, only: [:create, :show, :index, :destroy]
  post '/signup',         to: 'users#create'
  get '/users/:user_id', to: 'users#show'
  get '/users',          to: 'users#index'
  get '/cart-items', to: 'users#cart_items'

  post '/login',    to: 'sessions#create'
  post '/add-to-cart', to: 'products#add_to_cart'
  post '/change-cart-quantity', to: 'products#change_cart_quantity'
  post '/add-review', to: 'products#add_review'
  get '/logged_in', to: 'sessions#is_logged_in?'
  delete '/logout',   to: 'sessions#destroy'

end
