Rails.application.routes.draw do
  root to: 'pages#home'
  get '/categories', to: 'pages#categories'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
