require 'pry'
require './lib/item'
require './lib/food_truck'

RSpec.describe 'FoodTruck' do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  describe '#add_item' do
    it 'will add the item to the inventory attribute' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.add_item(item1)

      expect(food_truck.inventory.keys).to eq([item1])
      expect(food_truck.inventory[item1]).to eq(0)
    end
  end

  describe '#check_stock(item)' do
    it 'will return the stock of whatever item in in the argument' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.add_item(item1)
      food_truck.add_item(item2)

      expect(food_truck.check_stock(item1)).to eq(0)
      expect(food_truck.check_stock(item2)).to eq(0)
    end
  end

  describe '#stock(item, amount)' do
    it 'will add stock the item' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.add_item(item1)
      food_truck.add_item(item2)

      expect(food_truck.check_stock(item1)).to eq(0)
      expect(food_truck.check_stock(item2)).to eq(0)

      food_truck.stock(item1, 25)

      expect(food_truck.check_stock(item1)).to eq(25)
      expect(food_truck.check_stock(item2)).to eq(0)
    end
  end
end