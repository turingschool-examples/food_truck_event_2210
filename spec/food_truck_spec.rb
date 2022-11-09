require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  let(:food_truck)  {FoodTruck.new("Rocky Mountain Pies")}
  let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

  it 'is a foodtruck and has attributes' do
    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  it 'has methods to determine the quantity of an item on hand and add more' do
    expect(food_truck.check_stock(item1)).to eq(0)
     
    food_truck.stock(item1, 30)
    expect(food_truck.inventory).to eq({item1 => 30})
    expect(food_truck.check_stock(item1)).to eq(30)

    food_truck.stock(item1, 25)
    expect(food_truck.inventory).to eq({item1 => 55})
    expect(food_truck.check_stock(item1)).to eq(55)

    food_truck.stock(item2, 12)
    expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
    expect(food_truck.check_stock(item2)).to eq(12)
  end

  it 'has a method to find its potential revenue' do
    food_truck.stock(item1, 35)
    food_truck.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)

    expect(food_truck.potential_revenue).to eq(148.75)
    expect(food_truck2.potential_revenue).to eq(345.00)
    expect(food_truck3.potential_revenue).to eq(243.75)
  end

  it 'has a method to remove dollar signs from price' do
    expect(food_truck.remove_dollar_sign("$9.75")).to eq("9.75")
  end

 
end