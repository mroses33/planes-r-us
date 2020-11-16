Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planes, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create, :index, :show]
  end
end
