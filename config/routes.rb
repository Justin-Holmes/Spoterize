Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/spotify', as: :login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/pandora', to: 'pandora#index'

  resources :playlist, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      delete 'remove_like', to: 'likes#remove_like'
    end
  end
end
