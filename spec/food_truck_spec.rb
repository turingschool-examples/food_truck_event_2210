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
end
