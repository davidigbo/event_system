Rails.application.routes.draw do
  root 'event#index'

  get 'login', to: 'session#inew'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  resources :events
  resources :bookings, only: [:index, :new, :create]
end
