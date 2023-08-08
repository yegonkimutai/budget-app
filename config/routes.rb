Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'splash#splash', as: :unauthenticated_root
    end
  end


  resources :groups do
    resources :entities
  end
end
