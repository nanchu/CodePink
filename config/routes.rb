Codepink::Application.routes.draw do

  resources :location_groups
  resources :locations
  resources :users
  resources :publishers
  resources :drone_attacks
  resources :sessions, only: [:new, :create, :destroy]

  root :to => "maps#index"

  match "/tests" => "tests#index"
  match "/signup"  => "users#new"
  match "/admin" => "sessions#new"
  match "/signout" => "sessions#destroy", via: :delete

end
