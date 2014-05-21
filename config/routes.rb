Rails.application.routes.draw do
  get 'devices' => 'devices#index'
  post 'devices/register'

  resources :users
  match '/users/:id' => 'users#options', via: [:options]
end
