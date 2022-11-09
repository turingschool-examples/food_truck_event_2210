require './lib/food_truck'
require 'pry'

RSpec.describe FoodTruck do
  it 'food_truck exists and has attributes' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_instance_of(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  
end