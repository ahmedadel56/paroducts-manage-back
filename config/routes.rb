Rails.application.routes.draw do
  resources :categories
  resources :customers
  resources :bills
  resources :bill_products
  resources :products
  delete '/bill_products', to: 'bill_products#destroy'

end
