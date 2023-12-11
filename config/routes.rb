Rails.application.routes.draw do
  resources :logs, except: [:landing] do
    resources :brewers
    resources :grinders
    resources :coffees

    member do
      post 'increase_range'
      post 'decrease_range'
    end
  end

  resources :brewers
  resources :grinders
  resources :coffees
  devise_for :users

  
  root to: "logs#index"
end
