class ChefIngredientsController < ApplicationController

  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.dishes.joins(:dish_ingredients).select(:name).from(:ingredients)
  end

end
