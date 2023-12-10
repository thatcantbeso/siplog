Rails.application.routes.draw do
  resources :logs
  resources :brewers
  resources :grinders
  resources :coffees
  devise_for :users

  root to: "logs#index"
end
