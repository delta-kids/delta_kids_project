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
  get '/programs/0_5/arts_culture', to: 'programs#index0_5'
  get '/programs/0_5/sports', to: 'programs#index0_5'
  get '/programs/0_5/education', to: 'programs#index0_5'
  get '/programs/0_5/parent_child', to: 'programs#index0_5'
  get '/programs/0_5/childcare', to: 'programs#index0_5'

  get '/programs/6_12', to: 'programs#index6_12'
  get '/programs/6_12/arts_culture', to: 'programs#index6_12'
  get '/programs/6_12/sports', to: 'programs#index6_12'
  get '/programs/6_12/education', to: 'programs#index6_12'
  get '/programs/6_12/community', to: 'programs#index6_12'
  get '/programs/6_12/childcare', to: 'programs#index6_12'

  get '/services/pregnancy_babies', to: 'services#pregnancy_babies'
  get '/services/pregnancy_babies/help_crisis', to: 'services#pregnancy_babies'
  get '/services/pregnancy_babies/health', to: 'services#pregnancy_babies'
  get '/services/pregnancy_babies/support', to: 'services#pregnancy_babies'

  get '/services/families', to: 'services#families'
  get '/services/families/help_crisis', to: 'services#families'
  get '/services/families/childcare', to: 'services#families'
  get '/services/families/assistance', to: 'services#families'
  get '/services/families/support', to: 'services#families'

  get '/services/children', to: 'services#children'
  get '/services/children/help_crisis', to: 'services#children'
  get '/services/children/child_advocacy', to: 'services#children'
  get '/services/children/health', to: 'services#children'
  get '/services/children/support', to: 'services#children'


  get '/live', to: 'home#live', as: 'live'
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'
  get '/map', to: 'home#map', as: 'map'


  post '/contact_submit', to: 'home#submit', as: 'contacted'


  resources :resources

  resources :events

  resources :organizations

end
