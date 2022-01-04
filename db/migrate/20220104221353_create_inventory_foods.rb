class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|

      t.timestamps
    end
  end
end
