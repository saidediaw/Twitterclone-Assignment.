Rails.application.routes.draw do
  get 'messages/index'
  get '/messages', to: 'messages#index'
  root 'messages#index'
  resources :messages do
    collection do
      post :confirm
    end
  end

end
