Rails.application.routes.draw do
  resources :adventures do
    resources :maps
  end



  post '/adventures/new', to: 'users#new_adventure'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'

  post 'register', to: 'users#create'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'mobile_adventures', to: 'mobile#adventures'
  get 'mobile_test', to: 'mobile#test'

  get '/maps/:id/jsondata', to: 'maps#jsondata', as: 'set_map'

end
