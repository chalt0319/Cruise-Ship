Rails.application.routes.draw do
  root to: "application#welcome"

  resources :captains
  get '/captain/login' => "captains#login"
  post '/captain/login' => "captains#create"

  resources :ports

  resources :passengers do
    resources :excursions do
      resources :passenger_excursions
    end 
  end

  get '/passenger_excursions/most_recent' => "passenger_excursions#show"
  get '/login' => "passengers#login"
  post '/login' => "passengers#create"
  get '/logout' => "passengers#logout"
  get '/fb_login' => "passengers#fb_login"
  post '/fb_login' => "passengers#fb_create"
  get '/auth/facebook/callback' => 'passengers#create'

  resources :ships, only: [:index, :new, :create, :edit, :update, :destroy]

  get '/ships/largest_ship' => "ships#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
