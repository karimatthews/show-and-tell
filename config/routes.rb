Rails.application.routes.draw do

  root to: 'pages#main'

  resources :slots
  resources :sessions, except: [:show]

  get '/sessions/:unique_hash', to: 'sessions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
