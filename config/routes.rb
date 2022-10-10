Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts do
    resources :bookings, only: [:create, :update]
  end

  # route candidat
  resources :candidats, only: [:index]

  # route candidature
  resources :candidatures, only: %i[index], as: :candidatures

  # route profile candidat
  resources :profiles, except: %i[destroy new create]
  post '/profiles', to: 'profiles#update'

  # route profile recruteur
  resources :recruteurs, except: %i[destroy new create]

  # route wait list

  resources :waitlists, only: %i[index], as: :waitlists

  # route booking
  resources :bookings, only: [:destroy]

  # route mensuration
  resources :mensurations, only: %i[index show]

  # route books
  resources :books

  # route archive
  get "/archive", to: "archives#archive"
  patch "/archive", to: "archives#update"

  # route infos
  get "/infos", to: "infos#infos"
  post '/infos', to: 'infos#update'
  get '/infos/:id', to: 'infos#show', as: 'infos_show'

end
