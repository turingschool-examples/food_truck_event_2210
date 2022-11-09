# frozen_string_literal: true

require 'rspec'
require './lib/food_truck'
require './lib/item'
require './lib/event'

describe Event do
  describe '#initialize' do
    it 'exists and has attributes' do
      event = Event.new('South Pearl Street Farmers Market')

      expect(event).to be_instance_of(Event)
      expect(event.name).to eq('South Pearl Street Farmers Market')
      expect(event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck' do
    it 'can add food trucks to the collection' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1 = FoodTruck.new('Rocky Mountain Pies')
      food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck3 = FoodTruck.new('Palisade Peach Shack')

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end
  end

  describe '#food_truck_names' do
    it 'can state the added food truck\'s names from the collection' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1 = FoodTruck.new('Rocky Mountain Pies')
      food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck3 = FoodTruck.new('Palisade Peach Shack')

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_truck_names).to eq(['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns all trucks that sell specified item arg' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1 = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
      item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new('Palisade Peach Shack')
      food_truck3.stock(item1, 65)

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell(item3)).to eq([food_truck2])
      expect(event.food_trucks_that_sell('')).to eq([])
    end
  end

  describe '#list_all_items_sold' do
    it 'lists all of the items sold at event' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1 = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
      item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck2.stock(item4, 55)
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new('Palisade Peach Shack')
      food_truck3.stock(item1, 65)

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.list_all_items_sold).to eq([item1, item2, item4, item3])
    end
  end

  describe '#total_quantity_item' do
    it 'gathers total quantity of every item at the event' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1 = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
      item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck2.stock(item4, 55)
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new('Palisade Peach Shack')
      food_truck3.stock(item1, 65)

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.total_quantity_item(item1)).to eq(100)
    end
  end

  describe '#oversold_items' do
    it 'return a list of overstocked Items for an Event' do
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1 = FoodTruck.new('Rocky Mountain Pies')
      item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})
      item4 = Item.new({name: 'Banana Nice Cream', price: '$4.25'})
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
      food_truck2.stock(item4, 55)
      food_truck2.stock(item3, 25)
      food_truck3 = FoodTruck.new('Palisade Peach Shack')
      food_truck3.stock(item1, 65)

      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.oversold_items).to eq([item1])
    end
  end
end
