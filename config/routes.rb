Rails.application.routes.draw do
  namespace :user do
    root :to => 'main#main'
  end
  resources :products
  devise_for :users
  root to: 'home#home'
  get 'help' => 'home#help'
  get 'contact' => 'home#contact'
  get 'account' => 'account#account'

  get 'main' => 'main#main', as: 'listings'

  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
