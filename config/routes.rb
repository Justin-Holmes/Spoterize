Rails.application.routes.draw do
  root 'welcome#index'

  get '/email', to: 'welcome#email'
end
