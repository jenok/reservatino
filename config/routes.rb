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
    resources :reservations, only: [:index, :show] do
      member do
        put "confirm"
        put "decline"
      end
    end
    resources :profiles, only: [:edit, :update]
    resources :chefs, only: [:index, :edit, :update, :destroy]
    resources :menus, only: [:index, :edit, :update, :destroy]
    resources :reviews, only: [:index, :show]
    resources :images, only: [:index, :update, :destroy]
    # get "reservations/:id/confirm", to: "reservations#confirm"
  end

  namespace :customers do
    resources :restaurants, only: [:index, :show] do
      resources :reservations, only: [:create] do
        resources :payments, only: [:new, :create]
      end
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :reservations, only: [:index] do
      member do
        put "cancel"
      end
    end
  end
end
