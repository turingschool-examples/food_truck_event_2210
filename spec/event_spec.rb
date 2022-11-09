require 'pry'
require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe 'Event' do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market") 

    expect(event).to be_a(Event)
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  describe '#add_food_truck' do
    it 'will add a food truck' do
      event = Event.new("South Pearl Street Farmers Market") 

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")

      event.add_food_truck(food_truck1) 
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks). to eq([food_truck1, food_truck2, food_truck3])
    end
  end

  describe '#food_truck_names' do
    it 'will return an array with all the food truck names' do
      event = Event.new("South Pearl Street Farmers Market") 

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")

      event.add_food_truck(food_truck1) 
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_truck_names). to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#food_trucks_that_sell(item)' do
    it 'will return an array of foodtrucks that sell a specific item' do
      event = Event.new("South Pearl Street Farmers Market") 

      food_truck1 = FoodTruck.new("Rocky Mountain Pies")

      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      food_truck1.add_item(item1)
      food_truck1.add_item(item2)

      food_truck1.stock(item1, 35) 
      food_truck1.stock(item2, 7)  

      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")

      food_truck2.add_item(item3)
      food_truck2.add_item(item4)

      food_truck2.stock(item4, 50) 
      food_truck2.stock(item3, 25)

      food_truck3 = FoodTruck.new("Palisade Peach Shack") 

      food_truck3.add_item(item1)

      food_truck3.stock(item1, 65) 

      event.add_food_truck(food_truck1) 
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell(item2)).to eq([food_truck1])
      expect(event.food_trucks_that_sell(item3)).to eq([food_truck2])
      expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
    end
  end
end