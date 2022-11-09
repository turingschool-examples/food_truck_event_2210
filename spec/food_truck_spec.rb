require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:ft) {FoodTruck.new('Rock Springs Cafe')}
  let(:it1) {Item.new({name: 'Pumpkin Pie (Slice)', price: '$1.99'})}
  let(:it2) {Item.new({name: 'Rhubarb Pie (Slice)', price: '$0.99'})}

  it 'exists' do
    expect(ft).to be_a FoodTruck
  end

  it 'has a name' do
    expect(ft.name).to eq('Rock Springs Cafe')
  end

  describe '#inventory' do
    it 'starts as an empty hash' do
      expect(ft.inventory).to eq({})
    end
  end

  describe '#stock()' do
    it 'adds an item and quantity of item to hash' do
      ft.stock(it1, 20)

      expect(ft.inventory).to eq({it1 => 20})

      ft.stock(it1, 100)
      ft.stock(it2, 46)
      expect(ft.inventory).to eq({it1 => 120, it2 => 46})
    end
  end

  describe '#check_stock()' do
    it 'returns the quantity in stock for given item' do
      ft.stock(it1, 100)
      ft.stock(it2, 46)
      it3 = Item.new({name: 'Chocolate Chip Ice Cream(3 scoops)', price: '$2.99'})

      expect(ft.check_stock(it1)).to eq(100)
      expect(ft.check_stock(it2)).to eq(46)
      expect(ft.check_stock(it3)).to eq(0)
    end
  end

  describe '#potential_revenue' do
    it 'returns the amount they would recieve if they sell all items' do
      ft.stock(it1, 100)
      ft.stock(it2, 45)

      expect(ft.potential_revenue).to be_a Float
      expect(ft.potential_revenue).to eq(243.55)
    end
  end
end
