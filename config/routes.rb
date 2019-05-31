Rails.application.routes.draw do
  root to: "home#index"

  post "login", to: "house_sessions#create", as: "house_sessions"

  resources :houses, only: [:show] do
    resources :tasks, only: [:new, :create]
    resources :rooms, only: [:show]
    resources :users_tasks, only: [:update]
  end
end
