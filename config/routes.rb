Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get '/sign_up', to: 'user#new'
  post '/sign_up', to: 'user#sign_up'

  get '/login', to: 'user#login'
  post '/login', to: 'user#sign_in'
  delete '/logout', to: 'user#destroy'
  
  post '/messages', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
  
end
