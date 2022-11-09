require './lib/food_truck'

RSpec.describe FoodTruck do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new('Rocky Mountain Pies')
  end

  it 'exists and has empty attributes by default' do
    expect(@food_truck).to be_a FoodTruck
    expect(@food_truck.name).to eq('Rocky Mountain Pies')
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check the stock of a specific item' do
    expect(@food_truck.check_stock(@item1)).to eq 0
  end

  it 'can add stock of an item' do
    @food_truck.stock(@item1, 30)

    expect(@food_truck.check_stock(@item1)).to eq 30
  end
end