require 'rails_helper'

RSpec.feature 'Recipe Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @recipe = Recipe.create(user: @user, name: 'Wonderful cake', cooking_time: 5.5, preparation_time: 12.6,
                            description: 'Test the wondrful cake', public: true)
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    visit recipes_path
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(root_path)
  end

  it 'show the button of adding a recipe' do
    expect(page).to have_content 'Create Recipe'
  end

  it 'show recipe name' do
    expect(page).to have_content @recipe.name
  end

  it 'show recipe description' do
    expect(page).to have_content @recipe.description
  end

  it 'check the delete butto' do
    expect(page).to have_content 'Remove'
  end
end
