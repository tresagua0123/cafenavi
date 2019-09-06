Rails.application.routes.draw do

  get '/map_request', to: 'posts#map', as: 'map_request'
  devise_for :users
  resources :users
  resources :posts do
    resources :likes
    resources :comments
  end
 
  root 'posts#index'
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
