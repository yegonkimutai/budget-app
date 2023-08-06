Rails.application.routes.draw do
  devise_for :users
  root "group#index"

  resources :groups
end
