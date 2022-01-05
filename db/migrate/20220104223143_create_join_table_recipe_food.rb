class CreateJoinTableRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_join_table :recipes, :foods, table_name: :recipe_foods do |t|
      t.primary_key :id
      t.integer :quantity
      t.index [:recipe_id, :food_id]
    end
  end
end
