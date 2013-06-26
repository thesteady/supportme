ChatService::Application.routes.draw do

  resources :chats, only: [:create, :show, :update] do
    resources :messages, only: [:index, :create]
  end
  
end
