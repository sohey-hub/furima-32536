Rails.application.routes.draw do

  devise_for :users
  get 'items/index'
  root to: 'items#index'
  resources :items do
    resources :order, only: :create
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
