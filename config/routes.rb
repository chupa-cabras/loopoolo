Rails.application.routes.draw do

  resources :competencies
  resources :competency_types
  resources :levels
  resources :quests
  resources :comments
  resources :teams
  resources :companies
  resources :encounters
  # Back admin routes start


  put '/quests/:id/cancel', to: 'quests#cancel', as: 'quest_cancel'
  put '/quests/:id/finish', to: 'quests#finish', as: 'quest_finish'

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
