class IngredientsController < ApplicationController

  def index
    params[:chef_id]
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.dishes.joins(:dish_ingredients).select(:name)
    require "pry"; binding.pry
  end

end
