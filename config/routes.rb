Rails.application.routes.draw do

  get 'help', to: 'home#help'
  get 'contact', to: 'home#contact'
  root 'home#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
