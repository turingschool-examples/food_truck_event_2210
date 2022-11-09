require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  describe '#iteration 1' do
    let(:food_truck){FoodTruck.new('Rocky Mountain Pies')}
    
    it 'exists and has readable attributes' do
      expect(food_truck).to be_a(FoodTruck)
      expect(food_truck.name).to eq('Rocky Mountain Pies')
      expect(food_truck.inventory).to eq({})
    end
  end
end
