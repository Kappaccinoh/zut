# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"
Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/gameturns/:id', to: 'gameturns#update' # hypothesis is that PATCH needs to stem from GET

  resources :rooms do
    resources :messages
  end
  
  resources :users
  resources :groupparticipants
  resources :gameturns

  root 'rooms#index'
end
