Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   root to: 'application#index'


  get '/complete' => 'carts#order_complete'


  devise_for :users
  resources :pinned_products

  resources :order_items
  resources :products
  resource :cart, only: [:show]
  resources :charges
end
