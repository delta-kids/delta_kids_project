Rails.application.routes.draw do

  get 'topics/index'

  get 'topics/new'

  get 'topics/create'

  get 'topics/show'

  get 'topics/edit'

  get 'topics/update'

  get 'topics/destroy'

  get 'services/index'

  get 'services/new'

  get 'services/create'

  get 'services/show'

  get 'services/edit'

  get 'services/update'

  get 'services/destroy'

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

  resources :programs

  resources :resources

  resources :events

  # resources :organizations
  get '/organizations/new', to: 'organizations#new', as: 'organizations'



end
