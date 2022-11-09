# frozen_string_literal: true

require 'rspec'
require './lib/food_truck'
require './lib/item'

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

  describe '#item?' do
    it 'returns whether the truck stocks in inventory specified item' do
      food_truck1 = FoodTruck.new('Tacos')
      item1 = Item.new(name: 'Steak Taco', price: '$1.25')

      food_truck1.stock(item1, 100)

      expect(food_truck1.item?(item1)).to eq(true)
    end
  end

  describe '#potential_revenue' do
    it 'calculates all current inventory value' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.stock(item1, 1)

      expect(food_truck.check_stock(item1)).to eq(1)

      food_truck.stock(item2, 1)

      expect(food_truck.check_stock(item2)).to eq(1)
      expect(food_truck.potential_revenue).to eq(6.25)
      
      food_truck.stock(item2, 1)

      expect(food_truck.potential_revenue).to eq(8.75)
    end
  end

  describe '#list items sold' do
    it 'returns a list of all sold items on truck' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.stock(item1, 1)
      food_truck.stock(item2, 1)

      expect(food_truck.list_items_sold).to eq([item1, item2])
    end
  end

  describe '#list_items_sold_names' do
    it 'returns a list of names for the items sold' do
      food_truck = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      food_truck.stock(item1, 1)
      food_truck.stock(item2, 1)

      expect(food_truck.list_items_sold_names).to eq(['Peach Pie (Slice)', 'Apple Pie (Slice)'])
    end
  end
end
