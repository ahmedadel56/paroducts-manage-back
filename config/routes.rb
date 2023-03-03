Rails.application.routes.draw do
  resources :categories
  resources :customers
  resources :bills do
    resources :bill_products
  end
  resources :products
end
