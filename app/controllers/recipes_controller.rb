class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to recipes_url, notice: 'Recipe created successfully'
        else
          render :new, alert: 'Recipe not created. Please try again!'
        end
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
