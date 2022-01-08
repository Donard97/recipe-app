require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Donard', email: 'example@mail.com', password: 'password') }
  let(:recipe) do
    Recipe.create(user_id: user.id, name: 'Wonderful cake', cooking_time: 5.5, preparation_time: 12.6,
                  description: 'Test the wonderful cake', public: true)
  end

  describe 'Validations' do
    context 'when valid' do
      it { expect(recipe).to be_valid }
    end

    it 'should allow valid name of the recipe' do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end

    it 'should allow valid name' do
      recipe.name = 'Cake mm'
      expect(recipe).to be_valid
    end

    it 'should validate the cooking time' do
      recipe.cooking_time = -5
      expect(recipe).to_not be_valid
    end

    it 'should validate the cooking time' do
      recipe.cooking_time = 65.3
      expect(recipe).to be_valid
    end

    it 'should validate the preparation time' do
      recipe.preparation_time = -12.6
      expect(recipe).to_not be_valid
    end

    it 'should validate the preparation time' do
      recipe.preparation_time = 0
      expect(recipe).to be_valid
    end

    it 'should validate the description' do
      recipe.description = 'test' * 12
      expect(recipe).to be_valid
    end

    it 'should validate the description' do
      recipe.description = 'test' * 260
      expect(recipe).to_not be_valid
    end

    it 'should validate the public status' do
      recipe.public = false
      expect(recipe).to be_valid
    end

    it 'should validate the public status' do
      recipe.public = nil
      expect(recipe).to_not be_valid
    end
  end
end
