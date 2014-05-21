Rails.application.routes.draw do
  post 'devices/register'

  resources :users
  match '/users/:id' => 'users#options', via: [:options]
end
