require './lib/event'
require './lib/item'
require './lib/food_truck'

RSpec.describe Event do

  it 'exist' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_a(Event)
  end

  it 'has a name' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event.name).to eq("South Pearl Street Farmers Market")
  end

  it 'can has a food truck array' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event.food_trucks).to eq([])
  end

  it 'can add food truck to an array' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    expect(event.food_trucks).to eq([])

    event.add_food_truck(food_truck1)

    expect(event.food_trucks.length).to eq(1)

  end

  it 'can display all food truck names' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Food Truck Food")

    event.add_food_truck(food_truck1)

    expect(event.food_truck_names).to eq(["Rocky Mountain Pies"])

    event.add_food_truck(food_truck2)

    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Food Truck Food"])
  end

  it 'can display all food trucks that sell a given item' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65)

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
  end
end
