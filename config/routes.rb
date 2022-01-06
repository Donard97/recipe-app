Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new]
  end
  resources :recipe_foods, only: [:edit, :update, :destroy, :create]

  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root 
    end 
  end
end
