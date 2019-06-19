Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :maps
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'maps#index'
  get '/my_maps', to: 'maps#my_maps'
  get 'rock_glacier', to: 'maps#rock_glacier'
  get 'not_rock_glacier', to: 'maps#not_rock_glacier'
end
