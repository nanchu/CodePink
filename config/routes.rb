Codepink::Application.routes.draw do
  resources :drone_attacks

  root :to => "drone_attacks#index"
end
