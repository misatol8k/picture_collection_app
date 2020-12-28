Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:show, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
