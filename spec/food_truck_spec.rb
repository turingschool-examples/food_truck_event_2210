require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  let(:food_truck) { FoodTruck.new('Rocky Mountain Pies') }
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(food_truck).to be_a FoodTruck
      expect(food_truck.name).to eq 'Rocky Mountain Pies'
      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'returns the total number of a given item that the food truck has' do
      food_truck.stock(item1, 2)
      
      expect(food_truck.check_stock(item1)).to eq 2
      expect(food_truck.check_stock(item2)).to eq 0
    end
  end

  describe '#stock' do
    it 'adds an item and an amount of that item to the inventory' do
      food_truck.stock(item1, 2)
      food_truck.stock(item2, 3)
      expect(food_truck.inventory).to eq({ item1 => 2, item2 => 3 })
    end
  end

  describe '#potential_revenue' do
    it 'returns the potential total revenue of a food_truck' do
      food_truck.stock(item1, 2)
      food_truck.stock(item2, 3)
      expect(food_truck.potential_revenue).to eq 15.0
    end
  end

  describe '#sells?' do
    it 'returns a boolean indicating whether or not the given item is sold' do
      food_truck.stock(item1, 2)
      expect(food_truck.sells?(item1)).to be true
      expect(food_truck.sells?(item2)).to be false
    end
  end

  describe '#all_items' do
    it 'returns an array of all items stocked by the food_truck' do
      food_truck.stock(item1, 2)
      food_truck.stock(item2, 3)
      expect(food_truck.all_items).to eq [item1, item2]
    end
  end
end
