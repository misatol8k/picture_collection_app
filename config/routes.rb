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
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # アプリ提出時に本番環境でレターオープナーを使えるよう変更
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
