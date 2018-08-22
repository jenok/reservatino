Rails.application.routes.draw do
devise_for :restaurants
# , controllers: {
#   sessions:      'restaurants/sessions',
#   passwords:     'restaurants/passwords',
#   registrations: 'restaurants/registrations'
# }
devise_for :customers
# , controllers: {
#   sessions:      'customers/sessions',
#   passwords:     'customers/passwords',
#   registrations: 'customers/registrations'
# }

  authenticated :customer do
    root 'customers/restaurants#index', as: :customer_authenticated_root
  end

  authenticated :restaurant do
    root 'restaurants/reservations#index', as: :restaurant_authenticated_root
  end
  root to: 'pages#home'
  # resources :restaurants, only: [:index, :show] do
  #   resources :reservations, only: [:create]
  # end
  namespace :restaurants do
    resources :reservations, only: [:index, :show, :edit, :update]
    resources :profiles, only: [:edit, :update]
  end

  namespace :customers do
    resources :restaurants, only: :index # when you wanna add a new route, do like this -> [:index, :show]
  end
end
