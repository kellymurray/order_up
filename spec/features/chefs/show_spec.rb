require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do

    @chef = Chef.create!(name: 'Cat Cora')
    @dish_1 = @chef.dishes.create!(name: 'Taco', description: 'corn sandwich')
    @ingredient_1 = Ingredient.create!(name: 'Chicken', calories: 200)
    @ingredient_2 = Ingredient.create!(name: 'Tortilla', calories: 100)
    @ingredient_3 = Ingredient.create!(name: 'Lettuce', calories: 20)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)

    visit "/chefs/#{@chef.id}"
  end

    describe "When I visit a chef's page" do
      it "shows the name of the chef" do
        expect(page).to have_content(@chef.name)
      end
    end
  end
