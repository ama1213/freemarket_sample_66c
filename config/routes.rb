Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'index', to: 'users/registrations#index'
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'cards', to: 'users/registrations#new_card'
    post 'cards', to: 'users/registrations#create_card'
  end

  get 'comments/new', to: 'comments#new'
  get 'layouts/footer', to: 'layouts#footer'
  get 'layouts/application', to: 'layouts#application'
  get 'layouts/mailer', to: 'layouts#mailer'
  get 'layouts/mailer.text', to: 'layouts#mailer.text'

  get 'posts/menu', to: 'posts#menu'

  get 'products/order', to: 'products#order'
  get 'products/exhibition_page', to: 'products#exhibition_page'

  get 'users/edit', to: 'users#edit'
  get 'users/show', to: 'users#show'
  get 'users/identity_information', to: 'users#identity_information'
  get 'users/logout', to: 'users#logout'
  get 'users/payment_method', to: 'users#payment_method'
  
  root 'products#index'
  resources :products, except: :show
end
