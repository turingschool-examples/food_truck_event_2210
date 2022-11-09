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
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

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
    end
  end
end
