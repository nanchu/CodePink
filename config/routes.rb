Codepink::Application.routes.draw do

  resources :location_groups

  resources :locations
  resources :users
  resources :publishers
  resources :drone_attacks

  root :to => "maps#index"

  match "/tests" => "tests#index"
  match "/signup"  => "users#new"

end
