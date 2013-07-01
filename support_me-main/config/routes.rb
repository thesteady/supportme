SupportMe::Application.routes.draw do
  match "logout", to: "sessions#destroy"
  match "login",  to: "sessions#create"

  post "/demo", to: "demo#create", as: "create_demo"

  resources :sessions,  only: [:create, :destroy]
  resources :users,     only: [:create]
  resources :customers, only: [:new, :create]
  resources :messages,  only: [:create, :index]
  resources :demo,      only: [:show]

  root to: "home#show"

  namespace :admin do
    get '/support', to: 'chats#index', as: 'chats'
    resources :chats, only: [:show, :update]
  end

end
