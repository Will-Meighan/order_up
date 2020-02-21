require 'rails_helper'

describe 'As a visitor on the chef show page' do
  before :each do
    @chef_1 = Chef.create(name: "Will")
    @dish_1 = Dish.create(name: "Pizza", description: "Cheesy", chef: @chef_1)
    @ingredient_1 = @dish_1.ingredients.create(name: "Cheese", calories: 200)
    @ingredient_2 = @dish_1.ingredients.create(name: "Dough", calories: 150)
  end

  it 'I see the chef name' do
    expect(page).to have_content(@chef_1.name)
  end

  it "I see a link to view a list of all ingredients the chef uses" do
    click_link "View Ingredients"
    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end

end
