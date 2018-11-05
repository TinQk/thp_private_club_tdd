Rails.application.routes.draw do

  get '/', to: 'static_pages#home'

  resources :users

  # Routes pour les gestions de session :
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
