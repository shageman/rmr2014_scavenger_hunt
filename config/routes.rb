Scavenger::Application.routes.draw do
  resources :clues

  root to: "teams#index"
  resources :teams
end
