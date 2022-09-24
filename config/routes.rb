Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:destroy]

  # route profile
  get "/profile", to: "profiles#profile"
  post '/profile', to: 'profiles#update'
  get '/profile/:id', to: 'profiles#show', as: 'profile_show'

  # route booking


  # route mensuration
  get "/mensuration", to: "mensurations#mensuration"

  # route books
  resources :books

  # route archive
  get "/archive", to: "archives#archive"

  # route infos
  get "/infos", to: "infos#infos"
  post '/infos', to: 'infos#update'
  get '/infos/:id', to: 'infos#show', as: 'infos_show'

end
