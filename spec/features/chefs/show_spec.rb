require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do

    @chef = Chef.create!(name: 'Cat Cora')
    @dish1 = @chef.dishes.create!(name: 'Taco', description: 'corn sandwich')
    @ingredient1 = Ingredient.create!(name: 'Chicken', calories: 200)
    @ingredient2 = Ingredient.create!(name: 'Tortilla', calories: 100)
    @ingredient3 = Ingredient.create!(name: 'Lettuce', calories: 20)
    @ingredient4 = Ingredient.create(name: 'Broth', calories: 150)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient3)
    DishIngredient.create!(dish: @dish2, ingredient: @ingredient4)

    visit "/chefs/#{@chef.id}"
  end

    describe "When I visit a chef's page" do
      it "shows the name of the chef" do
        expect(page).to have_content(@chef.name)
      end
    end

    it "When I click on the chef's ingredient link, the chef's ingredient index page is displayed" do
      expect(page).to have_link("All Ingredients")
       click_link("All Ingredients")
       expect(current_path).to eq(chef_ingredients_path(@chef))
    end

    # it "When I load the page I see the chef's top 3 ingredients" do
    #       expect(page).to have_content(@ingredient4.name)
    #       expect(page).to have_content(@ingredient1.name)
    #       expect(page).to have_content(@ingredient2.name)
    #   end
    # end
