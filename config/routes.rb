Rails.application.routes.draw do
  resources :game_categories
  resources :game_mechanics
  resources :invites
  resources :brought_games
  resources :posts
  resources :game_designers
  resources :game_publishers
  resources :designers
  resources :publishers
  resources :mechanics
  resources :categories
  resources :ratings
  resources :my_games
  resources :boardgames
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
end
