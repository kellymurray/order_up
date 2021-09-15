require 'rails_helper'

RSpec.describe 'Show Page' do
  before :each do
    @chef = Chef.create!(name: 'Cat Cora')
    @dish_1 = @chef.dishes.create!(name: 'Taco', description: 'corn sandwich')
    @ingredient_1 = Ingredient.create!(name: 'Chicken', calories: 200)
    @ingredient_2 = Ingredient.create!(name: 'Tortilla', calories: 100)
    @ingredient_3 = Ingredient.create!(name: 'Lettuce', calories: 20)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)

    visit "/dishes/#{@dish_1.id}"
  end

  describe 'Attributes' do
    it 'can display a dish and its description with a list of ingredients and chef name' do
      within('section.dish') do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
      end

      within('section.chef-name') do
        expect(page).to have_content("Chef: #{@chef.name}")
      end
    end
  end
end
