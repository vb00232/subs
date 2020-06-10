Rails.application.routes.draw do
  resources :places
  resources :products

  mount ActionCable.server => '/cable'

  namespace :user do
    root :to => 'main#main'
  end

  devise_for :users

  root to: 'home#home'
  get 'help' => 'home#help'
  get 'contact' => 'home#contact'
  get 'privacy' => 'home#privacy_policy'
  get 'terms' => 'home#terms_and_conditions'
  get 'account' => 'account#account'
  get 'wishlist' => 'favorites#index'
  get 'main' => 'main#main', as: 'listings'

  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
