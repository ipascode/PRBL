Rails.application.routes.draw do
  resources :parts
  resources :buses
  resources :bus_lines
  resources :bus_models
  resources :mechanics
  resources :repairs
  resources :drivers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "repairs#index"
end
