Rails.application.routes.draw do
  resources :posts
  resources :topics
  resources :forums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'forums', to: 'forums#index'
end
