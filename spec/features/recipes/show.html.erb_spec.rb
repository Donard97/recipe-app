require 'rails_helper'

RSpec.feature 'Recipe Show', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @recipe = Recipe.create(user: @user, name: 'Wonderful cake', cooking_time: 5.5, preparation_time: 12.6, description: 'Test the wonderful cake', public: true)
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    visit recipe_path(@recipe)
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(root_path)
  end

  it 'shows the button of adding ingredients to the recipe' do
    expect(page).to have_content 'Add ingredient'
  end

  it 'shows recipe name' do
    expect(page).to have_content @recipe.name
  end

  it 'shows generate shopping list button' do
    expect(page).to have_content 'Generate shopping list'
  end
end
