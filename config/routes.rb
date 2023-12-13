Rails.application.routes.draw do
  resources :logs, except: [:show]
  resources :brewers, except: [:show]
  resources :grinders, except: [:show]
  resources :coffees, except: [:show]
  devise_for :users

  root to: "logs#index"
end
