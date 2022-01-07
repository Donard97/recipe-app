class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
    @foods = Food.joins(:recipe_foods).where(user_id: current_user.id)
    @total_price = 0
    @recipes.each do |recipe|
      @total_price += recipe.total_price
    end
  end
end
