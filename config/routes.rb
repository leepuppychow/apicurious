Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
  get 'login', to: redirect('/auth/github'), as: 'login'
  get 'logout', to: "session#destroy", as: 'logout'
  get "/auth/github/callback", to: "session#create"

  resources :dashboard, only: [:index]
end
