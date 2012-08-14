Codepink::Application.routes.draw do
  resources :drone_attacks, :test

  root :to => "drone_attacks#index"
  match "/test" => "test#index"

end
