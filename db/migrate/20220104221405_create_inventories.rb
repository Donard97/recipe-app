class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.text :description
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
