Rails.application.routes.draw do
  root 'countries#index', as: 'home'
  # get '/regions/:id', to: 'regions#show'
  # resources :countries do
  # 	resources :regions
  # end
  resources :countries do
    resources :regions, only: [:new, :create]
  end
  resources :regions do
    resources :cities, only: [:new, :create]
  end
  resources :cities do
    resources :holiday_houses, only: [:new, :create]
  end
  resources :holiday_houses
end
