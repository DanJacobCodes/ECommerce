Rails.application.routes.draw do
   root to: 'application#index'

  devise_for :users

  resource :cart, only: [:show]
  resources :order_items
  resources :products
end
