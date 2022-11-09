require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_a(Event)
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq []
  end

  describe '#add_food_truck' do
    it 'will add food trucks to the empty array' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      
      event.add_food_truck(food_truck1)
      expect(event.food_trucks).to eq [food_truck1]

      event.add_food_truck(food_truck2)
      expect(event.food_trucks).to eq [food_truck1, food_truck2]
    end
  end

  describe '#food_truck_names' do
    it 'returns an array of the food truck names' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expect(event.food_truck_names).to eq ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]   
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns an array of food trucks that sell the item' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      event.add_food_truck(food_truck1)
            
      food_truck1.stock(item1, 30)
      expect(event.food_trucks_that_sell(item1)).to eq [food_truck1]
      expect(event.food_trucks_that_sell(item2)).to eq []
    end
  end

  describe '#overstocked_items' do
    it ' returns an array of items sold by more than one food truck and 50 total quantity' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)

      expect(event.overstocked_items).to eq []
      food_truck1.stock(item1, 30)
      food_truck2.stock(item1, 30)

      expect(event.overstocked_items).to eq [item1]
    end
  end
end