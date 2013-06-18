SupportMe::Application.routes.draw do

  get '/demo'     => 'chats#index', as: 'chats'
  get '/demo/:id' => 'chats#show', as: 'chat'
  post '/demo'    => 'chats#create', as: 'chats'

  match "logout", to: "sessions#destroy"
  match "login",  to: "sessions#create"

  resources :sessions,  only: [:create, :destroy]
  resources :users,     only: [:create]
  resources :customers, only: [:new, :create]
  resources :messages,  only: [:create]

  root :to => "home#show"

  namespace :admin do
    get '/support', to: 'chats#index', as: 'chats'
    resources :chats, only: [:show]
  end
  
end
