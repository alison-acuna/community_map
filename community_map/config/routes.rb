Rails.application.routes.draw do
  root "people#index"
  resources :people
  # get "/people", to: "people#index"
  # get "/people/:id", to: "people#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
