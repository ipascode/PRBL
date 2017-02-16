Rails.application.routes.draw do
  devise_for :users
  resources :parts
  resources :buses
  resources :bus_lines do
   collection { post :import }
   end
  resources :bus_models do
   collection { post :import }
   end
  resources :mechanics
  resources :repairs 
  resources :drivers do
   collection { post :import }
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "repairs#index"
end
