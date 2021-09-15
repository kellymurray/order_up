class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  has_many :chefs, through: :dishes
  validates_presence_of :name

  def self.top_ingredients_by_chef(chef_id)
        joins(:chefs)
        .select('ingredients.*, count(dishes) as dish_count')
        .group('ingredients.id')
        .order(dish_count: :desc)
        .limit(3)
    end
end
