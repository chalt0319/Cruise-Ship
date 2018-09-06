Rails.application.routes.draw do
  resources :excursions
  resources :passengers
  resources :ships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
