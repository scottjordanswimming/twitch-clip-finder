Rails.application.routes.draw do
root 'sessions#home', as: 'home'
get 'about' => 'pages#about', as: 'about'
resources :clips do
  resources :reviews
end
  # resources :streamers
  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  # get '/most_popular' => 'clips#most_popular'
  #
  # get '/auth/:provider/callback' => 'sessions#create'
  #
  #
  resources :reviews
  resources :clips do
    resources :reviews, only: [:new, :index]
  end
  #
  resources :users, only: [:show]
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
