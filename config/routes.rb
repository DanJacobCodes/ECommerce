Rails.application.routes.draw do
   root to: 'application#index'

   
  get '/complete' => 'carts#order_complete'


  devise_for :users
  resources :pinned_products

  resources :order_items
  resources :products
  resource :cart, only: [:show]
  resources :charges
end
