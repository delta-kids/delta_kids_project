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

  # HOME CONTROLLER ROUTER
  get '/', to: 'home#index', as: 'home'
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  get '/programs/:id', to: 'programs#index'
  get '/live', to: 'home#live', as: 'live'
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'


  post '/contact_submit', to: 'home#submit', as: 'contacted'


  resources :resources

  resources :events

  resources :organizations

end
