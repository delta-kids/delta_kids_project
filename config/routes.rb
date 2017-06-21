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
  resources :program_types, only:[:new, :create] do
    resources :organization_program_types, only: [:create, :destroy]
  end
  # get '/program_types/new', to: 'program_types#new', as: ''


  get '/', to: 'home#index', as: 'home'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'

  get '/programs/0_5', to: 'programs#index0_5'

  get '/programs/6_12', to: 'programs#index6_12'

  get '/services/pregnancy_babies', to: 'services#pregnancy_babies'

  get '/services/families', to: 'services#families'

  get '/services/children', to: 'services#children'

  get '/live', to: 'home#live', as: 'live'
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'
  get '/map', to: 'home#map', as: 'map'

  get '/search', to: 'home#search', as: 'search'
  post '/search', to: 'home#search'

  get '/whatsnew', to: 'home#whatsnew', as: 'whatsnew'
  get '/surveys', to: 'home#surveys', as: 'surveys'

  post '/contact_submit', to: 'home#submit', as: 'contacted'

  resources :resources

  resources :events

  resources :organizations

end
