Rails.application.routes.draw do
  namespace :user do
    root :to => 'main#main'
  end
  resources :products
  devise_for :users
  root to: 'home#home'
  get 'help', to: 'home#help'
  get 'contact', to: 'home#contact'
  get 'account', to: 'account#account'
  get 'main', to: 'main#main'

  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
