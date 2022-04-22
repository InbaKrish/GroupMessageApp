Rails.application.routes.draw do
  root 'chatroom#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable_connection'
end
