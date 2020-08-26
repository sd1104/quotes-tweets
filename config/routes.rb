Rails.application.routes.draw do
  devise_for :users
  
  root "quotes#index"

  resources :quotes, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show]

end
