Rails.application.routes.draw do
  root to: 'products#show'
  root 'products#index'
  resources :products, except: :show
end