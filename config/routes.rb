Rails.application.routes.draw do
  
  devise_for :users

  resources :items do 
     resources :products
  end 

  resources :specials

  resources :aboutus, only: [:index]

  resources :termsofuse, only: [:index]

  resources :contacts

  get '/generalpages/:id', to: 'generalpages#aboutus'

  root 'items#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]
end
