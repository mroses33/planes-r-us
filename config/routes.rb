Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'planes/index'
  get 'planes/show'
  get 'planes/new'
  get 'planes/create'
  devise_for :users
  root to: 'pages#home'
  resources :planes, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create, :index, :show]
  end
end
