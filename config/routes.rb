Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles, only: %i[new create show edit update]

  resources :matches, only: %i[index show update] do
    resources :meetings, only: %i[new create]
    resources :chatrooms, only: %i[new create]
  end

  resources :chatrooms, only: %i[index show] do
    resources :messages, only: %i[create]
  end

  resources :meetings, only: %i[index update]

  namespace :user do
    root to: "profiles#new"
  end
  # resources :likes, only: %i[update destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
