Rails.application.routes.draw do

	devise_for :admins, controllers: {
        sessions:      'admins/sessions',
        passwords:     'admins/passwords',
        registrations: 'admins/registrations'
    }
  	devise_for :clients, controllers: {
        sessions:      'clients/sessions',
        passwords:     'clients/passwords',
        registrations: 'clients/registrations'
    }
  	devise_for :customers,controllers: {
        sessions:      'customers/sessions',
        passwords:     'customers/passwords',
        registrations: 'customers/registrations'
    }



  namespace :admins do
    get 'sites/top'
    get 'sites/new'
    post 'sites/create'
    resources :items, only: [:index]
    resources :genres,only:[:index, :create, :edit, :update]
  end

  namespace :clients do
    get 'items/index'
    get 'items/new'
    get 'items/top'
    resources :items, only: [:create,:show,:update,:edit]
    resources :orders,only: [:index, :show]
    get 'cart_items/index'
    get 'order_details/index'
    get 'customers/index'
  end

  namespace :customers do
    resources :cart_items, only: [:index, :create, :destroy, :update]
    delete 'cart_items/destroy_all'
    get 'orders/confirm'
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :create, :show]
    resources :posts, only: [:index, :create, :edit, :destroy,:update]
    get 'posts/new/:id',to:'posts#new',as:'new'
    resources :customer, only: [:index, :destroy, :create, :edit, :update]
    resources :addresses, only:[:index, :edit, :update, :destroy, :create]
  end

  # get 'review/:id',to:'orders#review',as:'review'
  # post 'review/:id',to:'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
