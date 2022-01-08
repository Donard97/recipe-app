class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(updated_at: :desc)
    @total_price = RecipeFood.where(recipe_id: @recipes.map(&:id)).map do |recipe_food|
      recipe_food.food.price * recipe_food.quantity
    end.sum
  end
end
