require 'rspec'
require './lib/food_truck'
require './lib/item'
require './lib/event'

describe Event do
  describe '#initialize' do
    it 'exists and has attributes' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event).to be_a Event
      expect(event.name).to eq 'South Pearl Street Farmers Market'
      expect(event.food_trucks).to eq []
    end
  end

  describe '#add_food_truck' do
    it 'can add food trucks to the event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 50)    
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      expect(event.food_trucks).to eq [food_truck1, food_truck2, food_truck3]
    end
  end

  describe '#food_truck_names' do
    it 'returns a list of footruck names for the event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 50)    
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      expect(event.food_truck_names).to eq ['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack']
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns a list of foodtrucks that sell a given item for an event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 50)    
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      expect(event.food_trucks_that_sell(item1)).to eq [food_truck1, food_truck3]
      expect(event.food_trucks_that_sell(item4)).to eq [food_truck2]
    end
  end

  describe '#total_item_quantity' do
    it 'returns the total quantity of an item across all food trucks' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 51)    
      food_truck2.stock(item3, 25)
      food_truck2.stock(item2, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      expect(event.total_item_quantity(item1)).to eq 100
      expect(event.total_item_quantity(item2)).to eq 32
      expect(event.total_item_quantity(item4)).to eq 51
    end
  end

  describe '#all_event_items' do
    it 'returns a list of all items sold at the event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 51)    
      food_truck2.stock(item3, 25)
      food_truck2.stock(item2, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      expect(event.all_event_items).to eq [item1, item2, item4, item3]
    end
  end
 
  describe '#overstocked_items' do
    it 'returns a list of items sold by more than 1 food truck with a quantity over 50' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 51)    
      food_truck2.stock(item3, 25)
      food_truck2.stock(item2, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      expect(event.food_trucks_that_sell(item1)).to eq [food_truck1, food_truck3]
      expect(event.food_trucks_that_sell(item2)).to eq [food_truck1, food_truck2]
      expect(event.food_trucks_that_sell(item4)).to eq [food_truck2]

      expect(event.total_item_quantity(item1)).to eq 100
      expect(event.total_item_quantity(item2)).to eq 32
      expect(event.total_item_quantity(item4)).to eq 51

      expect(event.overstocked_items).to eq [item1]
    end
  end

  describe '#all_event_item_names' do
    it 'returns an alphabetical list of all unique item names' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 51)    
      food_truck2.stock(item3, 25)
      food_truck2.stock(item2, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)
      
      expect(event.all_event_item_names).to eq ['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']
    end
  end

  describe '#total_inventory' do
    it 'returns a hash of all items sold at event with their quantity and food trucks' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1.stock(item1, 35)    
      food_truck1.stock(item2, 7)    
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
      food_truck2.stock(item4, 51)    
      food_truck2.stock(item3, 25)
      food_truck2.stock(item2, 25)
      food_truck3 = FoodTruck.new("Palisade Peach Shack")    
      food_truck3.stock(item1, 65)  

      event.add_food_truck(food_truck1)    
      event.add_food_truck(food_truck2)    
      event.add_food_truck(food_truck3)

      hash = event.total_inventory
      items = event.total_inventory.keys
      item_info = event.total_inventory.values
      hash_item1 = event.total_inventory.keys.first
      hash_item1_quantity = event.total_inventory[item1][:quantity]
      hash_item1_foodtrucks = event.total_inventory[item1][:sold_at]

      expect(hash.class).to eq Hash
      expect(items.all?(Item)).to be true
      expect(item_info.first.class).to eq Hash
      expect(hash_item1).to eq item1
      expect(hash_item1_quantity).to eq 100
      expect(hash_item1_foodtrucks).to eq event.food_trucks_that_sell(item1)
    end
  end
end