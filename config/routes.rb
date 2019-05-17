Rails.application.routes.draw do
  get 'rooms/show'
  get "houses/show"
  root to: "home#index"

  post "login", to: "house_sessions#create", as: "house_sessions"

  resources :houses, only: [:show] do
    resources :tasks, only: [:new, :create]
    resources :rooms, only: [:show]
  end
end
