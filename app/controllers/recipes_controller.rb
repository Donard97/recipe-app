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

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = 'Recipe deleted successfully!'
    else
      flash[:alert] = 'Unable to delete recipe. Please try again later.'
    end
    redirect_to(recipes_path)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :preparation_time, :cooking_time)
  end
end
