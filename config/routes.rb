Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  # User routes
  namespace :admin do
    resources :users, only: :index
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :users, only: [:new, :create]


  get '/', to: 'home#index', as: 'home'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'

  get '/programs/0_5', to: 'programs#index0_5'

  get '/programs/6_12', to: 'programs#index6_12'

  get '/services/pregnancy_babies', to: 'services#pregnancy_babies'

  get '/services/children', to: 'services#children'

  get '/services/families', to: 'services#families'

  get '/live', to: 'home#live', as: 'live'
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'
  get '/map', to: 'home#map', as: 'map'


  post '/contact_submit', to: 'home#submit', as: 'contacted'


  resources :resources

  resources :events

  resources :organizations

end
