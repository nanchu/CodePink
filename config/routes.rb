Codepink::Application.routes.draw do
  resources :drones

  root :to => "drones#index"
end
