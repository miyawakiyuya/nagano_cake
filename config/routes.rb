Rails.application.routes.draw do

  namespace :admin do
    resources :order_details, only: [:update]
  end

  namespace :admin do
    resources :orders, only: [:show, :update]
  end


  get  'orders/thanks',to: "orders#thanks"

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :orders,  only: [:index, :create, :show, :new]
  post 'orders/confirm',to: "orders#confirm"



  resources :cart_items, only: [:index, :create, :destroy, :update]
  delete 'cart_items' => 'cart_items#destroy_all'

  resources :items, only: [:index, :show]

  namespace :admin do
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
  end

  namespace :admin do
    get 'homes/top'
  end

  namespace :admin do
   resources :customers, only: [:index,:show,:edit,:update]
  end

  # get 'customers/show', to: "customers#show", as: 'my_page'

  resource :customers, only: [:edit,:update]
  get 'customers/my_page', to: 'customers#show'
  patch 'customers/my_page', to: 'customers#show'
  get'customers/quit'
  patch 'customers/out',to: "customers#out"


  root to: 'homes#top'
  get 'homes/about'


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
