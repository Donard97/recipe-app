class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(updated_at: :desc)
  end
end
