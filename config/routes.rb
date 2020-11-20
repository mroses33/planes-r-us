Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planes do
    resources :bookings, only: [:new, :create, :index, :show]
  end
  resources :users, only: [:show]
end
