Rails.application.routes.draw do

  root 'home#home'

  get 'help', to: 'home#help'
  get 'contact', to: 'home#contact'

  get 'account', to: 'account#account'
  
  get 'main', to: 'main#main'
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
