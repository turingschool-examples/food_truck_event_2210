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
    end
  end
end
