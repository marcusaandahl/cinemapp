Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rooms, only: [:index, :show]
  resources :sessions, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :cinemas, only: [:index, :show]
=======
  resources :movies, only: [:index, :show]
<<<<<<< HEAD
  resources :bookings
=======
>>>>>>> 27d6557448b17afed7c845b24bc0892672f76571
>>>>>>> 8c2082c6cbd6898aa219158cc647814a273b3222
end
