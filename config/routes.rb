Rails.application.routes.draw do

  get 'wishbooks/new'
  root "books#home"
  resources :books do
    resources :reviews
    resources :wishbooks
  end

  resources :users

  get "/about", to: "books#about"
  get '/searchuser', to: "users#search"
  post '/searchuser', to: "users#searchlist"
  get '/login', to: "sessions#new"
  get '/signup', to: "users#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get 'books/show'
  get 'reviews/new'
  get 'sessions/new'
  get 'books/new'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
