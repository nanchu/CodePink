Codepink::Application.routes.draw do
  #resources :maps
  #
  resources :drone_attacks

  #resources :reference_links

  #resources :publishers

  #resources :drone_attacks, :test

  root :to => "maps#index"
  match "/tests" => "tests#index"

end
