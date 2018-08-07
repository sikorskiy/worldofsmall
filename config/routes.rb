Rails.application.routes.draw do

  get 'authors/new'
  get 'authors/update'
  get 'authors/edit'
  get 'authors/create'
  get 'authors/index'
  get 'authors/resources'
  ActiveAdmin.routes(self)
  get 'wishbooks/new'
  root "books#home"
  resources :books do
    resources :reviews
    resources :wishbooks
  end

  resources :users
  resources :authors

  get "/about", to: "books#about"
  get '/searchuser', to: "users#search"
  post '/searchuser', to: "users#searchlist"
  get '/login', to: "sessions#new"
  get '/signup', to: "users#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
