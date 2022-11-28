Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :profiles
  resources :matches, only: %i[index show create]
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: %i[create]
  end
  resources :meetings, only: %i[index new create update]
  # resources :likes, only: %i[update destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
