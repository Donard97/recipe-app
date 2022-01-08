module ShoppingListHelper
  def foods_join
    # rubocop:disable Lint/UselessAssignment
    foods_join = Food.joins(:recipe_foods).where(user_id: current_user.id)
    # rubocop:enable Lint/UselessAssignment
  end
end
