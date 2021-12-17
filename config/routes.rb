# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#welcome'
  get '/users/:id', to: 'users#show'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id/discover', to: 'movies#new'
  get '/users/:id/movies', to: 'movies#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/users/:user_id/movies/:id', to: 'movies#show'

end
