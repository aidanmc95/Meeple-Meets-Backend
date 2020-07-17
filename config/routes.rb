Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
end
