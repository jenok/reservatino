Rails.application.routes.draw do
devise_for :restaurants, controllers: {
  sessions:      'restaurants/sessions',
  passwords:     'restaurants/passwords',
  registrations: 'restaurants/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
