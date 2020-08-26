Rails.application.routes.draw do
  devise_for :users
  
  root "quotes#index"

  resources :quotes, only: [:index, :new, :create, :show]
  resources :users, only: [:index] do
    collection do
      get 'myquote'
    end
  end
end
