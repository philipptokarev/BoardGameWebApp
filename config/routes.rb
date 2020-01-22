Rails.application.routes.draw do
  root to: 'home#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  delete 'signout', to: 'session#destroy'

  namespace :admin do
    root to: 'base#index'

    resources :board_games
  end

  resources :users
end
