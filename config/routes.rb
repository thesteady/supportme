SupportMe::Application.routes.draw do
 
  get '/demo' => 'chats#index', as: 'chats'
  get '/demo/:id' => 'chats#show', as: 'chat'

  # get '/support' => 'admins#chat', as: "admin_chat"

  # match "logout", to: "sessions#destroy"
  # match "login",  to: "sessions#new"

  # resources :users
  # resources :sessions
  resources :chats, only: [:create]
  resources :messages, only: [:create]

  # root :to => "home#index"
end
