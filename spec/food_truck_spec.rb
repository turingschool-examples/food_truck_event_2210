require './lib/food_truck'

describe FoodTruck do
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'exists and has attributes' do
    expect(food_truck).to be_a FoodTruck
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end
end