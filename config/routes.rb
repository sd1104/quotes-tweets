Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  
  root "quotes#index"

  resources :quotes, only: [:index, :new, :create, :show] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show] do
    get 'favorite'
  end

end
