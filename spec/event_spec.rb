require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do 
  it 'exists ad has attribtes' do 
    event = Event.new("South Pearl Street Farmers Market")  

    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  it 'can add a food truck to the event' do 
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

    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end

  it 'can return a food trucks name' do 
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

    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'can return an array of food trucks thats sell a specific item' do 
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

  it 'return a food trucks potential revenue' do 
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

    expect(food_truck1.potential_revenue).to eq(148.75)
    expect(food_truck2.potential_revenue).to eq(345.00)
    expect(food_truck3.potential_revenue).to eq(243.75)
  end

  it 'can return a list of overstocked items at an event' do
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
    food_truck3.stock(item4, 10)
    food_truck3.stock(item2, 12)

    event.add_food_truck(food_truck1) 
    event.add_food_truck(food_truck2) 
    event.add_food_truck(food_truck3)

    expect(event.overstocked_items).to eq([item1, item4])
  end

  it 'returns a list of all inventory item names alpabetically, does not include duplicates' do 
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
    food_truck3 = FoodTruck.new("Palisade Peach Shack")  
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Raspberry Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item4, 50) 
    food_truck2.stock(item3, 25)
    food_truck3.stock(item1, 65) 
    food_truck3.stock(item4, 10)
    food_truck3.stock(item2, 12)

    event.add_food_truck(food_truck1) 
    event.add_food_truck(food_truck2) 
    event.add_food_truck(food_truck3)

    expect(event.item_names).to eq(['Apple Pie (Slice)', 'Peach Pie (Slice)', "Raspberry Nice Cream"])
  end
end