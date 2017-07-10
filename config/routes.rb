Rails.application.routes.draw do
   root to: 'application#index'

  devise_for :users

  resources :order_items
  resources :products
  resource :cart, only: [:show]
end
