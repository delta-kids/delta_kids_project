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
  get '/programs/0_5/:type', to: 'programs#index0_5'
  # get '/programs/0_5/sports', to: 'programs#index0_5'
  # get '/programs/0_5/education', to: 'programs#index0_5'
  # get '/programs/0_5/parent_child', to: 'programs#index0_5'
  # get '/programs/0_5/childcare', to: 'programs#index0_5'

  get '/programs/6_12', to: 'programs#index6_12'
  get '/programs/6_12/:type', to: 'programs#index6_12'
  # get '/programs/6_12/sports', to: 'programs#index6_12'
  # get '/programs/6_12/education', to: 'programs#index6_12'
  # get '/programs/6_12/community', to: 'programs#index6_12'
  # get '/programs/6_12/childcare', to: 'programs#index6_12'

  get '/services/pregnancy_babies/:type', to: 'services#pregnancy_babies'
  # get '/services/pregnancy_babies/help_crisis', to: 'services#pregnancy_babies'
  # get '/services/pregnancy_babies/health', to: 'services#pregnancy_babies'
  # get '/services/pregnancy_babies/support', to: 'services#pregnancy_babies'

  get '/services/families/:type', to: 'services#families'
  # get '/services/families/help_crisis', to: 'services#families'
  # get '/services/families/childcare', to: 'services#families'
  # get '/services/families/assistance', to: 'services#families'
  # get '/services/families/support', to: 'services#families'

  get '/services/children/:type', to: 'services#children'
  # get '/services/children/help_crisis', to: 'services#children'
  # get '/services/children/child_advocacy', to: 'services#children'
  # get '/services/children/health', to: 'services#children'
  # get '/services/children/support', to: 'services#children'

  get '/programs/learn_more/:id', to: 'programs#learn_more', as: 'program_learn_more'
  get '/services/learn_more/:id', to: 'services#learn_more', as: 'service_learn_more'
  get '/events/learn_more/:id', to: 'events#learn_more', as: 'event_learn_more'
  get '/whats_new_items/learn_more/:id', to: 'whats_new_items#learn_more', as: 'whats_new_item_learn_more'

  get '/services/pregnancy_babies', to: 'services#pregnancy_babies'

  get '/services/families', to: 'services#families'

  get '/services/children', to: 'services#children'

  get '/live', to: 'home#live', as: 'live5210'

  get '/dashboard', to: 'home#dashboard', as: 'dashboard'
  get '/dashboard/pending_and_approved_events', to: 'events#pending_and_approved_events'
  get '/dashboard/pending_and_approved_resources', to: 'resources#pending_and_approved_resources'
  get '/dashboard/manage_programs', to: 'programs#index'
  get '/dashboard/manage_services', to: 'services#index'
  get '/dashboard/manage_organizations', to: 'organizations#index'
  get '/dashboard/manage_events', to: 'events#index2'
  get '/dashboard/manage_whats_new_items', to: 'whats_new_items#index'
  get '/dashboard/manage_resources', to: 'resources#index2'

  get '/map', to: 'home#map', as: 'map'

  # get '/search', to: 'home#search', as: 'search'
  # post '/search', to: 'home#search'

  get '/surveys', to: 'home#surveys', as: 'surveys'

  post '/contact_submit', to: 'home#submit', as: 'contacted'



  resources :resources

  resources :whats_new_items

  resources :services

  resources :events

  resources :organizations

  resources :programs

end
