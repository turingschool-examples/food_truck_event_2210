require 'rspec'
require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  describe '#initialize' do
    it 'exists and has attributes' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_a FoodTruck
      expect(food_truck.name).to eq 'Rocky Mountain Pies'
      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'checks the quantity of an Item on the food truck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq 0
    end
  end

  describe '#stock' do
    it 'can stock an item on the food truck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      expect(food_truck.check_stock(item1)).to eq 30
    end

    it 'adds to an items quantity if the item is already in stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      expect(food_truck.check_stock(item1)).to eq 30

      food_truck.stock(item1, 25)

      expect(food_truck.check_stock(item1)).to eq 55
    end

    it 'can add different items to the same inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      
      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      
      food_truck.stock(item2, 12)

      expect(food_truck.inventory).to eq({item1 => 30, item2 => 12})
    end
  end
end