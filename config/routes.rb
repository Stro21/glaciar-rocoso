Rails.application.routes.draw do
  resources :maps
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'maps#index'
  get '/my_maps', to: 'maps#my_maps'
  get 'glaciar_rock', to: 'maps#glaciar_rock'
  get 'not_glaciar_rock', to: 'maps#not_glaciar_rock'
end
