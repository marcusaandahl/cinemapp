Rails.application.routes.draw do
  root to: 'pages#home'

  get "profile", to: "pages#profile"

  devise_for :users

  resources :movies, only: [:index, :show] do
    resources :sessions, only: [:index, :show] do
      resources :seats, only: [:index, :update]
      resources :bookings, only: [:create]
    end
  end

  resources :cinemas, only: [:index, :show] do
    resources :sessions, only: [:index, :show] do
      resources :seats, only: [:index, :update]
      resources :bookings, only: [:create]
    end
  end

  resources :bookings, only: [:index, :destroy]

end
