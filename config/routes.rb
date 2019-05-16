Rails.application.routes.draw do
  get 'houses/show'
  root to: "home#index"

  post "login", to: "house_sessions#create", as: "house_sessions"

  resources :houses, only: [:show]
end
