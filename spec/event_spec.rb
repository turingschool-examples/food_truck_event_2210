require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do

  it 'exist and has attributes' do 
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_a(Event)
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  it 'can add a food truck to an event ' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end

  it 'can return the list of food truck names for an event' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
    food_truck3 = FoodTruck.new("Palisade Peach Shack")

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'can return the list of food trucks that sell a given item for an event' do
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
    expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
  end

  it 'can alphabetically sort items that all the food trucks have' do
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
    
    expect(event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
  end

  # it 'can report overstock items' do
  #    event = Event.new("South Pearl Street Farmers Market")
  #   food_truck1 = FoodTruck.new("Rocky Mountain Pies")
  #   food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
  #   food_truck3 = FoodTruck.new("Palisade Peach Shack")
  #   item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  #   item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  #   item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  #   item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
  #   food_truck1.stock(item1, 35)    
  #   food_truck1.stock(item2, 7)
  #   food_truck2.stock(item4, 50)    
  #   food_truck2.stock(item3, 25)
  #   food_truck3.stock(item1, 65)

  #   event.add_food_truck(food_truck1)    
  #   event.add_food_truck(food_truck2)    
  #   event.add_food_truck(food_truck3)

  #   expect(event.overstocked_items).to eq([item1])
  # end
end
