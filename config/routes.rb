Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/categories', to: 'pages#categories'
  get 'profile/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
