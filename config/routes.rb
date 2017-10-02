Rails.application.routes.draw do
  get 'users/new'

  resources :users
  resources :maps
  resources :posts
  resources :topics
  resources :forums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  #get 'forums', to: 'forums#index'
  root :to => 'forums#index'

  resources :forums

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #post 'users', to: 'users#create'
end
