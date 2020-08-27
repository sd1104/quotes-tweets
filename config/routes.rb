Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  
  root "quotes#index"

  resources :quotes, only: [:index, :new, :create, :show] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show] do
    get 'favorite'
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

end
