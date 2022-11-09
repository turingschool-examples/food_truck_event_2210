require 'rspec'
require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  it 'exists and has a name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  describe '#inventory' do
    it 'returns a hash for its inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'checks the stock of an item on the food truck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end
end
