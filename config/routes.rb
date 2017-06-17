Rails.application.routes.draw do

  root to: 'pages#main'

  resources :slots, only: [:edit, :update]
  resources :sessions, only: [:edit, :new, :create, :update]

  get '/sessions/:unique_hash', to: 'sessions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
