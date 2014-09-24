Scavenger::Application.routes.draw do
  resources :clues

  root to: "teams#index"
  resources :teams do
    member do
      get 'next'
    end
  end
end
