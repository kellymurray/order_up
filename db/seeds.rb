# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@chef1 = Chef.create(name: 'Cat Cora')
@dish1 = @chef.dishes.create(name: 'Taco', description: 'Corn Sandwich')
@dish2 = @chef.dishes.create(name: 'Soup', description: 'Broth')
@ingredient1 = Ingredient.create(name: 'Chicken', calories: 200)
@ingredient2 = Ingredient.create(name: 'Tortilla', calories: 100)
@ingredient3 = Ingredient.create(name: 'Lettuce', calories: 20)
@ingredient4 = Ingredient.create(name: 'Broth', calories: 150)
@dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
@dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
@dish_ingredient3 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
@dish_ingredient4 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
