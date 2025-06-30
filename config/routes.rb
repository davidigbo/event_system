Rails.application.routes.draw do
  # Admin namespace
  namespace :admin do
    resources :bookings
    resources :events
    resources :tickets
    resources :users

    root to: "bookings#index"  # Admin dashboard root
  end

  # Public root path
  root 'sessions#new'

  # Session routes
  get 'login', to: 'session#new'  # double-check if you meant 'new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  # Public-facing resources
  resources :events
  resources :booking, only: [:index, :new, :create]
end
