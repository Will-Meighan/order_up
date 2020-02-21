require 'rails_helper'

describe "As a visitor on the dish show page", type: :feature do
  it "I see the chef and infgredients" do
    chef_1 = Chef.create(name: "Will")
    dish_1 = Dish.create(name: "Pizza", description: "Cheesy", chef: chef_1)
    ingredient_1 = dish_1.ingredients.create(name: "Cheese", calories: 200)
    ingredient_2 = dish_1.ingredients.create(name: "Dough", calories: 150)

    visit("/dishes/#{dish_1.id}")

    expect(page).to have_content(chef_1.name)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end
end
