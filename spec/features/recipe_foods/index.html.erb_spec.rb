require 'rails_helper'

RSpec.feature 'RecipeFood Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Donard', email: 'user@example.com', password: 'password')
    @food = Food.create(name: 'Potato', measurement_unit: 'kg', price: 10, user: @user)
    @recipe = Recipe.create(name: 'Sandwich', cooking_time: 1, preparation_time: 2, description: 'description', public: false,
                            user: @user)
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    click_link('My Recipes')
    click_link(@recipe.name)
    click_link('Add ingredient')
  end

  it 'check the recipe_food path' do
    expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe.id))
  end

  it 'check the input elements' do
    expect(page).to have_selector('input')
  end

  it 'check the input elements' do
    expect(page).to have_selector('select')
  end

  it 'check the input elements' do
    expect(page).to have_content('Potato')
  end
end
