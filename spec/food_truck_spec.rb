require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  let(:ft) {FoodTruck.new('Rock Springs Cafe')}
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
end
