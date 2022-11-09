require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  it 'exists' do
    ft = FoodTruck.new("Rock Springs Cafe")

    expect(ft).to be_a FoodTruck
  end
end
