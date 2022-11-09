require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let(:event)       {Event.new("South Pearl Street Farmers Market")}
  let(:food_truck1)  {FoodTruck.new("Rocky Mountain Pies")}
  let(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
  let(:item1)       {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2)       {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let(:item3)       {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4)       {Item.new({name: "Banana Nice Cream", price: "$4.25"})}

  it 'exists and has attributes' do
    expect(event).to be_a(Event)
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  it 'has a method to add food trucks' do
    event.add_food_truck(food_truck1)
    expect(event.food_trucks).to eq([food_truck1])
    
    event.add_food_truck(food_truck2)
    expect(event.food_trucks).to eq([food_truck1, food_truck2])

    event.add_food_truck(food_truck3)
    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end

  it 'has a method to list the names of the food trucks' do
    event.add_food_truck(food_truck1)
    expect(event.food_truck_names).to eq(["Rocky Mountain Pies"])
    
    event.add_food_truck(food_truck2)
    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom"])

    event.add_food_truck(food_truck3)
    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'has a method to find trucks that sell a specific item' do
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
    expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
  end

  it 'has a method to find overstocked items' do
    food_truck2.stock(item4, 50)
    food_truck1.stock(item1, 35)
    food_truck3.stock(item1, 65)
    food_truck1.stock(item2, 7)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.overstocked_items).to eq([item1])

    food_truck1.stock(item4, 1)
    expect(event.overstocked_items).to eq([item1, item4])

    food_truck3.stock(item3, 90)
    expect(event.overstocked_items).to eq([item1, item4])
  end

  it 'has a method to find the names of all items sold, sorted alphabetically and not duplicated' do
    food_truck2.stock(item4, 50)
    food_truck1.stock(item1, 35)
    food_truck3.stock(item1, 65)
    food_truck1.stock(item2, 7)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.item_names).to eq(['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)'])
  end

  it 'has a method to find total inventory and quantity, as well as who sells an item' do
    food_truck2.stock(item4, 50)
    food_truck1.stock(item1, 35)
    food_truck3.stock(item1, 65)
    food_truck1.stock(item2, 7)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.total_inventory).to eq()

  end



end