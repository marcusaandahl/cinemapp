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
>>>>>>> 27d6557448b17afed7c845b24bc0892672f76571
end
