Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'

  devise_for :users
  resources :users, only: [:index, :show] do
    get 'favorite'
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  root "quotes#index"

  resources :quotes, only: [:index, :new, :create, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: :create
  end

  get '/quote/tag/:name', to: "quotes#tag"
  get '/quote/tag' => 'quotes#tag'
  
end
