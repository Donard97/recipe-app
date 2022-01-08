Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'
  resources :foods, only: [:index, :create, :new, :destroy]

  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new, :destroy]
  end
  
  resources :recipe_foods, only: [:index, :edit, :update, :destroy, :create, :new]

  resources :public_recipes, only: %i[index]

  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root 
    end 
  end

  get 'shopping_list', to: 'shopping_list#index'
end