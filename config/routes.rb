Rails.application.routes.draw do
  root "people#index"

  resources :people, only: [:index, :show]
  resources :films, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :starships, only: [:index, :show]
  resources :species, only: [:index, :show]

  get "/about", to: "pages#about", as: "about"
  get "/search", to: "search#index", as: "search"
end