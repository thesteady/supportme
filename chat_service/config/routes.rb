ChatService::Application.routes.draw do
  resources :chats, only: [:create, :show, :update]
end
