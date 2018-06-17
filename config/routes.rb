Rails.application.routes.draw do
  get 'users/show'
  root "books#home"
  resources :books
  resources :users
  get "/about", to: "books#about"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
