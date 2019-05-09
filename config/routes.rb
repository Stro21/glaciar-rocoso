Rails.application.routes.draw do
  resources :maps
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'maplists#index'
end
