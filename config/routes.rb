Rails.application.routes.draw do

  resources :quests
  resources :comments
  resources :teams
  resources :companies
  resources :encounters
  # Back admin routes start


  post '/quests/:id/cancel', to: 'quests#cancel'

  namespace :admin do
    resources :users

    # Admin root
    root to: 'application#index'
  end
  # Back admin routes end

  # Front routes start
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # Application root
  root to: 'home#index'
  # Front routes end
end
