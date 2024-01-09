require "sidekiq/web"
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#show"
  get "/sent", to: "mailers#sent"
  resources :mailers, only: [:create]

  mount Sidekiq::Web => "/sidekiq"

end
