Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/categories', to: 'pages#categories'
  get '/profile/:id', as: 'profile', to: 'users#show'
  get '/:id/booking', as: 'users_bookings', to: 'users#bookings'
  resources :providers do
    get 'provider/:id/bookings/:id/confirmation',as: 'booking_confirmation', to: 'bookings#confirmation'
    resources :bookings do
      resources :payments, only: :new
    end
    resources :reviews, only: :create
  end
  resources :chatrooms, only: [:new, :create, :show, :index] do 
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
