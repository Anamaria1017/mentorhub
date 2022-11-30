Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles, only: %i[new create show edit update]
  resources :matches, only: %i[index show update]

  resources :chatrooms, only: %i[show new create] do
    resources :messages, only: %i[create]
    root to: 'chatrooms#index'
  end
  resources :meetings, only: %i[index new create update]

  namespace :user do
    root to: "profiles#new"
  end
  # resources :likes, only: %i[update destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
