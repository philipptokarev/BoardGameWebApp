Rails.application.routes.draw do
  root 'home#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'

  resources :users
end
