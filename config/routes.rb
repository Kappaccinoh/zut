# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"
Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :rooms do
    resources :messages
  end
  resources :users
  root 'rooms#index'
end
