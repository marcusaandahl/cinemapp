Rails.application.routes.draw do
  root to: 'pages#home'

  get "profile", to: "pages#profile"

  get "/components", to: "pages#components"
  get '/dashboard', to: 'dashboards#dashboard', as: :dashboard
  get "/active", to: "dashboards#active", as: :active
  get "/history", to: "dashboards#history", as: :history

  devise_for :users

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # GO DIRECTLY TO SESSIONS (SKIP MOVIES/CINEMAS)

  resources :movies, only: [:index, :show] do
    resources :sessions, only: [:index, :show] do
      resources :orders, only: :create
    end
  end

  resources :orders, only: :show

  resources :cinemas, only: [:index, :show] do
    get "/map", to: "cinemas#map", as: :map

    resources :sessions, only: [:index, :show] do
      # resources :seats, only: [:index, :update]
      resources :bookings, only: [:create]
    end
  end

end
