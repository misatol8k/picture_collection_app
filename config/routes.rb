Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  get 'pictures/index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
