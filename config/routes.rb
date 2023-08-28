Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "test#index"
  get '/test', to: 'test#index'
  get '/test2', to: 'test#create'
  get '/prueba', to: 'prueba#index'
  get '/prueba/:id', to: 'prueba#show', as: 'product'
  

end
