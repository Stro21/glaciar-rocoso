Rails.application.routes.draw do
  resources :list_of_maps
  resources :maps
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'maps#index'
end
