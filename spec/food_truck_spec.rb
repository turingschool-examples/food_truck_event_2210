require './lib/food_truck'
require './lib/item'
require 'pry'

RSpec.describe FoodTruck do
  it 'food_truck exists and has attributes' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_instance_of(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end
  
  it '#stock is 0 by default' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3:75"})
    item2 = Item.new({name: "Apple Pie (Slice)", price: "$2.50"})

    expect(food_truck.check_stock(item1)).to eq(0) 
    expect(food_truck.check_stock(item2)).to eq(0) 
  end

  it '#stock add item to inventory with stock qty' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3:75"})
    item2 = Item.new({name: "Apple Pie (Slice)", price: "$2.50"})

    expect(food_truck.check_stock(item1)).to eq(0) 
    expect(food_truck.stock(item1, 30)).to eq(food_truck.inventory[item1])
    expect(food_truck.check_stock(item1)).to eq(30)
    expect(food_truck.check_stock(item2)).to eq(0)
    
    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)
    expect(food_truck.check_stock(item1)).to eq(55)
    expect(food_truck.inventory).to be_instance_of(Hash)
  end

end