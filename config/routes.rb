Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipe_foods/index'
  get 'recipe_foods/show'
  get 'inventory_foods/index'
  get 'inventory_foods/show'
  get 'inventories/index'
  get 'inventories/show'
  get 'foods/index'
  get 'foods/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "foods#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
