Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts, except: [:index] do
    resources :bookings, only: [:create, :update]
  end
  get "candidat", to: "pages#candidat"
  get "/profile", to: "profiles#profile"
  post '/profile', to: 'profiles#update'
  get '/profile/:id', to: 'profiles#show', as: 'profile_show'
end
