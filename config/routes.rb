require 'resque/server'

Rails.application.routes.draw do

  mount Resque::Server.new, at: "/resque"

  root 'welcome#index'
  get '/auth/spotify',          as: :login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/pandora',               to: 'pandora#index'
  get '/playlist/completed',    to: 'playlist#completed'
  delete '/logout',             to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      delete 'remove_like',     to: 'likes#remove_like'
    end
  end

  resources :playlist, only: [:new, :create]
end
