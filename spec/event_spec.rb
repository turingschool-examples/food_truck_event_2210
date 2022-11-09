require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'pry'

RSpec.describe Event do
  it 'event exists and has attributes' do
    event = Event.new('South Pearl Street Farmers Market')

    expect(event).to be_instance_of(Event)
    expect(event.name).to eq('South Pearl Street Farmers Market')
    expect(event.food_trucks).to eq([])
  end

  it "#add_food_truck can add trucks to event" do
    event = Event.new('South Pearl Street Farmers Market')

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

    expect(food_truck1.check_stock(item2)).to eq(7)
    expect(food_truck2.check_stock(item3)).to eq(25)
    expect(food_truck3.inventory).to include(item1)

    event.add_food_truck(food_truck1)    
    event.add_food_truck(food_truck2)    
    event.add_food_truck(food_truck3)

    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])

    end

    it "Event can list food truck names" do
    event = Event.new('South Pearl Street Farmers Market')

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

    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it "Event can show which food_trucks sell what item" do
        event = Event.new('South Pearl Street Farmers Market')

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

        expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
        expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
        end

    it "Event can calculate the potential revenue for each truck" do
        event = Event.new('South Pearl Street Farmers Market')

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

        expect(food_truck1.potential_revenue).to eq(148.75)
        expect(food_truck2.potential_revenue).to eq(345.00)
        expect(food_truck3.potential_revenue).to eq(243.75)

    end

    it "Even can return a list of all items food trucks have in stock" do
        event = Event.new('South Pearl Street Farmers Market')

        food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        food_truck1.stock(item1, 35)    
        food_truck1.stock(item2, 7)
        food_truck1.stock(item3, 31)    
        food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
        food_truck2.stock(item4, 55)    
        food_truck2.stock(item3, 25)
        food_truck3 = FoodTruck.new("Palisade Peach Shack")    
        food_truck3.stock(item1, 65)
    
        event.add_food_truck(food_truck1)    
        event.add_food_truck(food_truck2)    
        event.add_food_truck(food_truck3)

        expect(event.all_items).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end

        it "event can return has with info on items, what truck sells them, and their stock" do
            event = Event.new('South Pearl Street Farmers Market')

            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
            food_truck1.stock(item1, 35)    
            food_truck1.stock(item2, 7)
            food_truck1.stock(item3, 31)    
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
            food_truck2.stock(item4, 55)    
            food_truck2.stock(item3, 25)
            food_truck3 = FoodTruck.new("Palisade Peach Shack")    
            food_truck3.stock(item1, 65)
    
            event.add_food_truck(food_truck1)    
            event.add_food_truck(food_truck2)    
            event.add_food_truck(food_truck3)
            
            expect(event.total_inventory).to be_instance_of(Hash)
        end
end
