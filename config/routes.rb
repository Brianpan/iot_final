Rails.application.routes.draw do
  root to: 'dashboard#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sensors do
  	collection do
  		get "portal"
  	end
  end

  get '/dashboard' => 'dashboard#show'
  get '/dashboard/map_sensor_data' => 'dashboard#map_sensor_data'
end
