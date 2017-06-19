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


  get 'topics/index'

  get 'topics/new'

  get 'topics/create'

  get 'topics/show'

  get 'topics/edit'

  get 'topics/update'

  get 'topics/destroy'

  get 'tags/index'

  get 'tags/new'

  get 'tags/create'

  get 'tags/show'

  get 'tags/edit'

  get 'tags/update'

  get 'tags/destroy'

  get 'resources/index'

  get 'resources/new'

  get 'resources/create'

  get 'resources/show'

  get 'resources/edit'

  get 'resources/update'

  get 'resources/destroy'

  get 'age_groups/index'

  get 'age_groups/new'

  get 'age_groups/create'

  get 'age_groups/show'

  get 'age_groups/edit'

  get 'age_groups/update'

  get 'age_groups/destroy'

  get 'events/index'

  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  get 'categories/index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/show'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  get 'event/index'

  get 'event/new'

  get 'event/create'

  get 'event/show'

  get 'event/edit'

  get 'event/update'

  get 'event/destroy'

  get 'category/index'

  get 'category/new'

  get 'category/create'

  get 'category/show'

  get 'category/edit'

  get 'category/update'

  get 'category/destroy'


  get '/', to: 'home#index', as: 'home'

  get '/about', to: 'home#about', as: 'about'

  get '/contact', to: 'home#contact', as: 'contact'

  get '/programs/0_5', to: 'programs#index0_5'

  get '/programs/6_12', to: 'programs#index6_12'

  get '/services/pregnancy_babies', to: 'services#pregnancy_babies'

  get '/services/families', to: 'services#families'

  get '/services/children', to: 'services#children'

  get '/services', to: 'services#index'

  get '/services/families/:id', to: 'services#families'

  get '/live', to: 'home#live', as: 'live'


  post '/contact_submit', to: 'home#submit', as: 'contacted'


  resources :resources

  resources :events

  resources :organizations

end
