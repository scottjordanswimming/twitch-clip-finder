Rails.application.routes.draw do
  root 'clips#index', as: 'home'
  match '/auth/:github/callback', to: 'sessions#create', via: [:get, :post]

  resources :clips do
    resources :reviews
  end

  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users', to:'users#index', as: 'users'
  post '/users/new', to:'users#new'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  resources :streamers
  get '/streamers_favorites' => 'streamers#favorites'
  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/', to: 'sessions#destroy'

  resources :users, only: [:show]
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
