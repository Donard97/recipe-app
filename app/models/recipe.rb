class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :cooking_time, :preparation_time, numericality: { greater_than_or_equal_to: 0 }
  validates :public, inclusion: { in: [true, false] }

  def total_items
    recipe_foods.sum(:quantity)
  end

  def total_price
    recipe_foods.joins(:recipe, :food).sum('price * quantity')
  end
end
