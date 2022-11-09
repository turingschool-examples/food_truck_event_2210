require 'rspec'
require './lib/food_truck'

RSpec.describe FoodTruck do
  it 'exists and has a name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  describe '#inventory' do
    it 'returns a hash for its inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

    end
  end
end
