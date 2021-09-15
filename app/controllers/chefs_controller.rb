class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
    @top_ingredients = Ingredient.top_ingredients_by_chef(params[:id])
  end

end
