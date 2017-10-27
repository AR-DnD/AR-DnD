Rails.application.routes.draw do
  resources :adventures
  get 'users/new'

  resources :users
  resources :maps
  resources :forums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  #get 'forums', to: 'forums#index'
  #root :to => 'forums#index'


  post 'register', to: 'users#create'
  # post 'signup', to: 'sessions#create'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/maps/:id/jsondata', to: 'maps#jsondata', as: 'set_map'

  #post 'users', to: 'users#create'
end
