module ShoppingListHelper
  def foods_join
    foods_join = Food.joins(:recipe_foods).where(user_id: current_user.id)
  end
end
