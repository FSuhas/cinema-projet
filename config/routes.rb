Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts do
    resources :bookings, only: [:create, :update]
  end

  # route profile
  resources :profiles, except: %i[destroy new create]
  post '/profiles', to: 'profiles#update'

  # route candidat
  resources :candidats, only: [:index]

  # route candidature
  resources :candidatures, only: %i[index], as: :candidatures

  # route booking
  resources :bookings, only: [:destroy]

  # route mensuration
  resources :mensurations, only: %i[index show]

  # route books
  resources :books

  # route archive
  get "/archive", to: "archives#archive"
  patch "/archive", to: "archives#update"

end
