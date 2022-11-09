require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do 
  describe '#initialize' do 
    it 'will exist and have attributes' do 
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_a(FoodTruck)
      expect(food_truck.name).to eq("Rock Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end 
  end 
end