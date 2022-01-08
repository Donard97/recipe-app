class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[edit update destroy]
  before_action :set_foods, only: %i[edit new update]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
    @recipe_food.save
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_path(@recipe_food.recipe), notice: 'Recipe food was successfully created.'
        end
      else
        set_foods
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html do
          redirect_to recipe_path(recipe_food_params[:recipe_id]), notice: 'Recipe food was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Recipe Food deleted successfully.'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def set_foods
    @foods = current_user.foods.map { |food| [food.name, food.id] }
  end

  def set_recipe_food
    @recipe_food = RecipeFood.includes(:recipe, :food).find(params[:id])
  end

  def recipe_food_params
    params.fetch(:recipe_food, {}).permit(:quantity, :food_id, :recipe_id)
  end
end
