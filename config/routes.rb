Rails.application.routes.draw do
  resources :comments
  root to: 'products#show'
end
