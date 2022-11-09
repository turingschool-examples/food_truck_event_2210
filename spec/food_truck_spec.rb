require 'rspec'
require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  describe '#initialize' do
    it 'instantiates correctly' do
      ft = FoodTruck.new('Rocky Mountain Pies')

      expect(ft).to be_a FoodTruck
      expect(ft.name).to eq('Rocky Mountain Pies')
      expect(ft.inventory).to eq({})
    end
  end

  describe '#stock' do
    it 'adds an item to the inventory hash with a stock count and updates the stock count if the item already exists' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      ft = FoodTruck.new('Rocky Mountain Pies')

      ft.stock(item1, 30)
      expect(ft.inventory).to eq({item1 => 30})
      ft.stock(item1, 25)
      expect(ft.inventory).to eq({item1 => 55})  
      ft.stock(item2, 12)
      expect(ft.inventory).to eq({item1 => 55, item2 => 12})
    end
  end

  describe '#check_stock' do
    it 'returns the stock count of a given item' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      ft = FoodTruck.new('Rocky Mountain Pies')

      expect(ft.check_stock(item1)).to eq(0)
      ft.stock(item1, 30)
      expect(ft.check_stock(item1)).to eq(30)
      ft.stock(item1, 25)
      expect(ft.check_stock(item1)).to eq(55)
      expect(ft.check_stock(item2)).to eq(0)
      ft.stock(item2, 12)
      expect(ft.check_stock(item2)).to eq(12)
    end
  end

  describe '#potential_revenue' do
    it 'calculates the potential revenue if a food truck sells all its stock' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      ft = FoodTruck.new('Rocky Mountain Pies')
      ft.stock(item1, 30)
      ft.stock(item2, 12)

      expect(ft.potential_revenue).to eq(142.50)
    end
  end

  describe '#items_sold_by_name' do
    it 'returns an array of all item names in inventory' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      ft = FoodTruck.new('Rocky Mountain Pies')
      ft.stock(item1, 30)
      ft.stock(item2, 12)

      expect(ft.items_sold_by_name).to eq(['Peach Pie (Slice)', 'Apple Pie (Slice)'])
    end
  end
end
