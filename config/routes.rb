Rails.application.routes.draw do
  resources :ports

  resources :passengers do
    resources :excursions
  end

  resources :ships

  root to: "application#welcome"

  # get '/add_excursion' => "excursion#add"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
