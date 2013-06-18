SupportMe::Application.routes.draw do

  get '/demo'     => 'chats#index', as: 'chats'
  get '/demo/:id' => 'chats#show', as: 'chat'
  post '/demo'    => 'chats#create', as: 'chats'

  # get '/support' => 'admins#chat', as: "admin_chat"

  match "logout", to: "sessions#destroy"
  match "login",  to: "sessions#create"

  resources :sessions,  only: [:create, :destroy]
  resources :users,     only: [:create]
  resources :customers, only: [:new, :create]
  resources :messages,  only: [:create]

  root :to => "home#show"
end
