require './lib/food_truck'
require './lib/item'


RSpec.describe FoodTruck do

  it 'exist' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
  end

  it 'has a name' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has an inventory' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
  end

  it 'can check the stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it 'can stock items' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    # require 'pry' ; binding.pry
    expect(food_truck.check_stock(item1)).to eq(30)
  end

  it 'can see if it has an item as a key' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    expect(food_truck.key_match(item1)).to be(false)

    food_truck.stock(item1, 30)

    expect(food_truck.key_match(item1)).to be(true)
  end

  it 'can add to a stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    expect(food_truck.check_stock(item1)).to eq(30)

     # require 'pry' ; binding.pry
    food_truck.stock(item1, 25)

    expect(food_truck.check_stock(item1)).to eq(55)

  end
end
