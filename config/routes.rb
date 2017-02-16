Rails.application.routes.draw do
  devise_for :users
  resources :parts do
   collection { post :import }
   end
  resources :buses do
   collection { post :import }
   end
  resources :bus_lines do
   collection { post :import }
   end
  resources :bus_models do
   collection { post :import }
   end
  resources :mechanics do
   collection { post :import }
   end
  resources :repairs do
   collection { post :import }
   end
  resources :drivers do
   collection { post :import }
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "repairs#index"
end
