class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :foods, :users_id, :user_id
    rename_column :inventories, :users_id, :user_id
    rename_column :recipes, :users_id, :user_id
  end
end
