Rails.application.routes.draw do
  resources :coffees
  devise_for :users
  root to: "home#index"
end
