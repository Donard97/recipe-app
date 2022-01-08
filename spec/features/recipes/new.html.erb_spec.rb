require 'rails_helper'

RSpec.feature 'Food Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    visit recipes_path
    click_link('Create Recipe')
  end

  it 'user can see inputs and button' do
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'creates the recipe successfully' do
    fill_in 'recipe[name]', with: 'Wonderful eggs'
    fill_in 'recipe[cooking_time]', with: '10'
    fill_in 'recipe[preparation_time]', with: '10'
    fill_in 'recipe[description]', with: 'wow wow'
    click_button 'Add Recipe'
    expect(page).to have_content 'Recipe created successfully'
  end

  it 'Navigate automatically to the root recipe page after creating it' do
    fill_in 'recipe[name]', with: 'Wonderful eggs'
    fill_in 'recipe[cooking_time]', with: '10'
    fill_in 'recipe[preparation_time]', with: '10'
    fill_in 'recipe[description]', with: 'wow wow'
    click_button 'Add Recipe'
    expect(page).to have_current_path(recipes_url)
  end
end
