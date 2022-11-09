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
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    expect(event.food_trucks).to eq([])

    event.add_food_truck(food_truck1)

    expect(event.food_trucks.length).to eq(1)

  end

  it 'can display all food truck names' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

    event.add_food_truck(food_truck1)

    expect(event.food_truck_names).to eq("South Pearl Street Farmers Market")
  end
end
