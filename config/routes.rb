Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts, except: [:index] do
    resources :bookings, only: [:create, :update]
  end

  # route candidat
  get "candidat", to: "pages#candidat"

  # route recruteur


  # route profile
  get "/profile", to: "profiles#profile"
  post '/profile', to: 'profiles#update'
  get '/profile/:id', to: 'profiles#show', as: 'profile_show'

  # route booking


  # route mensuration
  get "/mensuration", to: "mensurations#mensuration"
  post '/mensuration', to: 'mensurations#update'
  get '/mensuration/:id', to: 'mensurations#show', as: 'mensuration_show'

  # route books
  resources :books

  # route archive
  get "/archive", to: "archives#archive"
  post '/archive', to: 'archives#update'
  get '/archive/:id', to: 'archives#show', as: 'archive_show'

  # route infos
  get "/infos", to: "infos#infos"
  post '/infos', to: 'infos#update'
  get '/infos/:id', to: 'infos#show', as: 'infos_show'

end
