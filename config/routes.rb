Rails.application.routes.draw do
  get 'users/new'
  get 'sessions/new'
  get 'pictures/index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
