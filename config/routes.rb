Rails.application.routes.draw do
  # resources :game_categories
  # resources :game_mechanics
  resources :invites
  # resources :brought_games
  # resources :game_designers
  # resources :game_publishers
  resources :designers
  resources :publishers
  resources :mechanics
  resources :categories
  resources :ratings
  resources :boardgames
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :my_games, only: [:create, :destroy]
      resources :meets
      resources :invites, only: [:create, :update, :destroy]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
