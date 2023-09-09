Rails.application.routes.draw do  
  devise_for :users
  get '/users/sign_out', to: 'users#destroy'
  get 'posts/index'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  resources :users, only: [:index, :show, :sign_out] do 
    resources :posts, only: [:index, :show, :new, :create]  do
      member do 
        post 'increment_likes'
      end
      resources :comments, only: [:index,:new, :create]          
    end
  end  
  
  get '/users/:user_id/posts/:id/increment_likes', to: 'posts#increment_likes'
  
  get '/users/:user_id/posts/:id/new_comment', to: 'comments#new', as: 'new_comment'

  
  root "users#index"
end
