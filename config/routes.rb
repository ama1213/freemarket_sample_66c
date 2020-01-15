Rails.application.routes.draw do
  get 'layouts/footer', to: 'layouts#footer'
  get 'layouts/application', to: 'layouts#application'
  get 'layouts/mailer', to: 'layouts#mailer'
  get 'layouts/mailer.text', to: 'layouts#mailer.text'

  get 'posts/footer', to: 'posts#footer'
  get 'posts/header', to: 'posts#header'
  get 'posts/login', to: 'posts#login'
  get 'posts/product', to: 'posts#product'
  get 'posts/index', to: 'posts#index'
  get 'posts/menu', to: 'posts#menu'
  get 'posts/index', to: 'posts#index'

  get 'products/order', to: 'products#order'
  get 'products/show', to: 'products#show'

  get 'users/sidebar', to: 'users#sidebar'
  get 'users/edit', to: 'users#edit'
  get 'users/identity_information', to: 'users#identity_information'
  get 'users/logout', to: 'users#logout'
  get 'users/payment', to: 'users#payment'
  get 'users/show', to: 'users#show'
end