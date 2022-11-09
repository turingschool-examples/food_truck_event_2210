require './lib/event'
require './lib/food_truck'
require './lib/item'

RSpec.describe Event do
  let(:event) { Event.new('South Pearl Street Farmers Market') }
  let(:food_truck1) { FoodTruck.new("Rocky Mountain Pies") }
  let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom') }
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }
  let(:item3) { Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) }
  let(:item4) { Item.new({ name: 'Banana Nice Cream', price: '$4.25'}) }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(event).to be_a Event
      expect(event.name).to eq 'South Pearl Street Farmers Market'
      expect(event.food_trucks).to eq []
    end
  end

  describe '#add_food_truck' do
    it 'adds a food_truck to food_trucks array' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      expect(event.food_trucks).to eq [food_truck1, food_truck2]
    end
  end

  describe '#food_truck_names' do
    it 'returns an array of food_truck names associated with the event' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      expect(event.food_truck_names).to eq ['Rocky Mountain Pies', 'Ba-Nom-a-Nom']
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns an array of food_trucks that sell a given item' do
      food_truck1.stock(item1, 1)
      food_truck2.stock(item1, 2)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      expect(event.food_trucks_that_sell(item1)).to eq [food_truck1, food_truck2]
    end
  end

  describe '#overstocked_items' do
    it 'returns an array of items who are overstocked' do
      food_truck1.stock(item1, 55)
      food_truck1.stock(item2, 33)
      food_truck2.stock(item1, 10)
      food_truck2.stock(item2, 22)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      expect(event.overstocked_items).to eq([item1, item2])
    end
  end

  describe '#all_items_by_name' do
    it 'returns an alphabetized list of all item names sold at the event' do
      food_truck1.stock(item1, 55)
      food_truck1.stock(item2, 33)
      food_truck2.stock(item1, 10)
      food_truck2.stock(item2, 22)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      expect(event.all_items_by_name).to eq [item2, item1]
    end
  end

  describe '#item_index' do
    it 'returns a hash whose keys are items and values are total inventory and food_trucks that sell that item' do
      food_truck1.stock(item1, 55)
      food_truck1.stock(item2, 33)
      food_truck2.stock(item1, 10)
      food_truck2.stock(item2, 22)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      expect(event.item_index).to eq(
        {
          item1: { total_inventory: 65, sold_by: [food_truck1, food_truck2] },
          item2: { total_inventory: 55, sold_by: [food_truck1, food_truck2] }
        }
      )
    end
  end
end
