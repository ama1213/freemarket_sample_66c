Rails.application.routes.draw do
  get 'comments/new', to: 'comments#new'
  get 'layouts/footer', to: 'layouts#footer'
  get 'layouts/application', to: 'layouts#application'
  get 'layouts/mailer', to: 'layouts#mailer'
  get 'layouts/mailer.text', to: 'layouts#mailer.text'

  get 'posts/menu', to: 'posts#menu'

  get 'products/order', to: 'products#order'
  get 'products/show', to: 'products#show'

  get 'users/edit', to: 'users#edit'
  get 'users/show', to: 'users#show'
  get 'users/identity_information', to: 'users#identity_information'
  get 'users/logout', to: 'users#logout'
  get 'users/payment_method', to: 'users#payment_method'

  get 'users/new', to: 'users#new'
  get 'users/entry', to: 'users#entry'
  get 'users/number', to: 'users#number'
  get 'users/signin_adress', to: 'users#signin_adress'
  get 'users/pay', to: 'users#pay'
  get 'users/done', to: 'users#done'
end