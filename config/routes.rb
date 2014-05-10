Rails.application.routes.draw do
  resources :users
  match '/users/:id' => 'users#options', via: [:options]
end
