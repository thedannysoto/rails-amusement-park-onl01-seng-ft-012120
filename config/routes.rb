Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  delete '/logout', to: 'sessions#destroy'
  post '/attractions/:id', to: 'attractions#ride'
  root 'sessions#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
