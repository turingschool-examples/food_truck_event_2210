# frozen_string_literal: true

require 'rspec'
require './lib/food_truck'

describe FoodTruck do
  describe '#initialize' do
    it 'exists and has attributes' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      
      expect(food_truck).to be_instance_of(FoodTruck)
      expect(food_truck.name).to eq('Rocky Mountain Pies')
      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it '#checks inventory for specified items' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item1 = double('item')

      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'adds items to the inventory collection' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.stock(item1, 25)

      expect(food_truck.check_stock(item1)).to eq(25)

      food_truck.stock(item2, 12)

      expect(food_truck.check_stock(item2)).to eq(12)

      food_truck.stock(item1, 30)

      expect(food_truck.check_stock(item1)).to eq(55)
      expect(food_truck.inventory.keys).to eq([item1, item2])
    end
  end

  describe '#has_item' do
    food_truck1 = FoodTruck.new('Tacos')
    item1 = Item.new(name: 'Steak Taco', price: '$1.25')

    food_truck1.stock(item1, 100)

    expect(food_truck1.has_item(item1)).to eq(true)
  end
end
