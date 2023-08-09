Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  unauthenticated do
    root "splash#splash", as: :unauthenticated_root
  end

  resources :groups do
    resources :items
  end
end
