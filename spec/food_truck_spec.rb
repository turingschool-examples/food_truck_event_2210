require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:foodtruck) { FoodTruck.new('Rocky Mountain Pies')}
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }

  describe '#initialize' do
    it '#exists' do
      expect(foodtruck).to be_a(FoodTruck)
      expect(foodtruck.name).to eq('Rocky Mountain Pies')
      expect(foodtruck.inventory).to eq({})
    end
  end

  describe '#stock()' do
    it 'puts an item and count into the inventory' do
      foodtruck.stock(item1, 30)
      expect(foodtruck.inventory[item1]).to eq(30)

      foodtruck.stock(item1, 25)
      expect(foodtruck.inventory[item1]).to eq(55)
    end
  end

  describe '#check_stock()' do
    it 'returns available count of checked item' do
      expect(foodtruck.check_stock(item1)).to eq(0)

      foodtruck.stock(item1, 30)
      expect(foodtruck.check_stock(item1)).to eq(30)

      foodtruck.stock(item2, 12)
      expect(foodtruck.check_stock(item2)).to eq(12)

      foodtruck.stock(item1, 25)
      expect(foodtruck.check_stock(item1)).to eq(55)
    end
  end

  describe '#potential_revenue' do
    it 'returns total potential revenue based on inventory and prices' do

      foodtruck.stock(item1, 30)
      foodtruck.stock(item2, 12)

      expect(foodtruck.potential_revenue).to be_a(Float)
      expect(foodtruck.potential_revenue).to eq(142.50)
    end
  end
end