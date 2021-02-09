Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suits, only: [:index, :new, :create, :show] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :bookings, only: [:new, :create]
  end
    resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
