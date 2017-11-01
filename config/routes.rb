Rails.application.routes.draw do
  resources :adventures
  resources :maps

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'

  post 'register', to: 'users#create'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/maps/:id/jsondata', to: 'maps#jsondata', as: 'set_map'

end
