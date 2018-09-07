Rails.application.routes.draw do
  resources :ports

  resources :passengers do
    resources :excursions
  end

  resources :ships

  root to: "application#welcome"

  get '/login' => "passengers#login"
  post '/login' => "passengers#create"
  get '/logout' => "passengers#logout"

  get '/auth/facebook/callback' => 'passengers#create'

  # get '/add_excursion' => "excursion#add"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
