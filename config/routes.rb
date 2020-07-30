Rails.application.routes.draw do
  resources :boardgames, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :designers
      # resources :publishers
      # resources :mechanics
      # resources :categories
      # resources :ratings
      resources :users, only: [:create, :show]
      resources :my_games, only: [:create, :destroy]
      resources :meets
      resources :invites, only: [:create, :update]
      resources :brought_games, only: [:create, :destroy]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
