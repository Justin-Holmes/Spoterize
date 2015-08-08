Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/spotify', as: :login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/pandora', to: 'pandora#index'

  resources :playlist, only: [:new, :create]
end
