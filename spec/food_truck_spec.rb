require './lib/food_truck'

RSpec.describe do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to be_a Hash
    expect(food_truck.check_stock(item1)).to eq []
  end
end