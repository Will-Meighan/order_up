require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "methods" do
    it "total_calories" do
      chef_1 = Chef.create(name: "Will")
      dish_1 = Dish.create(name: "Pizza", description: "Cheesy", chef: chef_1)
      ingredient_1 = dish_1.ingredients.create(name: "Cheese", calories: 200)
      ingredient_2 = dish_1.ingredients.create(name: "Dough", calories: 150)

      expect(dish_1.total_calories).to eq(350)
    end
  end
end
