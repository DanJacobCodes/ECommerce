Rails.application.routes.draw do
   root to: 'application#index'

  devise_for :users

  resource :cart, only: [:show]
  resources :products 
end
