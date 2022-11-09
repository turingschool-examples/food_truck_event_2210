require 'rspec'
require './lib/food_truck'
require './lib/event'

describe Event do
  describe '#initialize' do
    it 'instantiates correctly' do
      event = Event.new('South Pearl Street Farmers Market')

      expect(event).to be_a Event
      expect(event.name).to eq('South Pearl Street Farmers Market')
      expect(event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck' do
    it 'adds a food_truck object to @food_trucks array' do
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')

      event.add_food_truck(food_truck1)
      expect(event.food_trucks).to eq([food_truck1])
      event.add_food_truck(food_truck2)
      expect(event.food_trucks).to eq([food_truck1, food_truck2])
      event.add_food_truck(food_truck3)
      expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
    end
  end

  describe '#food_truck_names' do
    it 'returns an array of the names of all food trucks' do
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#food_trucks_that_sell' do
    it 'returns an array of food truck object instances that sell the given item' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')
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
  end

  describe '#event_items' do
    it 'returns an array of all unique items sold at the event' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.event_items).to eq([item2, item4, item1, item3])
    end
  end

  describe '#over_stocked_items' do
    it 'returns an array of items that are overstocked (sold by more than 1 truck and greate than 50 stock quantity' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.over_stocked_items).to eq([item1])
    end
  end

  describe '#event_item_names' do
    it 'returns a list of unique item names' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.event_item_names).to eq(['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"])
    end
  end

  describe '#event_inventory' do
    it 'returns a hash that lists all items and total quantity as well as trucks that sell those items' do
      item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
      item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      event = Event.new('South Pearl Street Farmers Market')
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item4, 50)
      food_truck2.stock(item3, 25)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.event_inventory).to eq({
                                            item2 =>
                                            {
                                              total_qty: 7,
                                              sold_at: [food_truck1]
                                            },
                                            item4 =>
                                            {
                                              total_qty: 50,
                                              sold_at: [food_truck2]
                                            },
                                            item1 =>
                                            {
                                              total_qty: 100,
                                              sold_at: [food_truck1, food_truck3]
                                            },
                                            item3 =>
                                            {
                                              total_qty: 25,
                                              sold_at: [food_truck2]
                                            }
                                          })
    end
  end
end
