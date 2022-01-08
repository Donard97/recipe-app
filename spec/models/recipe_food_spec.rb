require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'Donard', email: 'example@mail.com', password: 'password') }
  let(:food) { Food.create(user_id: user.id, name: 'Apple', measurement_unit: 'kg', price: 12) }
  let(:recipe) do
    Recipe.create(name: 'Pizza', cooking_time: 1, preparation_time: 2, description: 'description', public: false,
                  user_id: user.id)
  end

  let(:recipe_food) { RecipeFood.create(quantity: 10, food_id: food.id, recipe_id: recipe.id) }
  describe 'Validations' do
    context 'when valid' do
      it { expect(recipe_food).to be_valid }
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = 'Egg'
      expect(recipe_food).to_not be_valid
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = -3
      expect(recipe_food).to_not be_valid
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = 3
      expect(recipe_food).to be_valid
    end
  end
end
