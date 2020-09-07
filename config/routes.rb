Rails.application.routes.draw do
  namespace :clients do
    get 'genres/index'
    resources :genres, only: [:create, :edit, :update]
    get 'items/index'
    get 'items/new'
    get 'items/top'
    resources :items, only: [:show,:update,:edit]
    get 'orders/index'
    get 'orders/show'
  end

  devise_for :admins
  devise_for :clients
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
