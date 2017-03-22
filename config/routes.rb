Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'users/sessions' }, :path_prefix => 'my'
  
  resources :users do
    collection { post :import }
  end

  get 'home/index' 
  get 'report/index'
  get '/bushistory/' => 'repairs#bushistory', :defaults => { :format => 'json' }

  resources :parts do
   collection { post :import }
   end
  resources :buses do
   collection { post :import }
    member do
      post 'odometer_add'
      post 'odometer_subtract'
    end
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
    
      member do
      post'job_start'
      end
    
   end

  resources :drivers do
   collection { post :import }
   end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "home#index"
end
