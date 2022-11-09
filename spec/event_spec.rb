require './lib/food_truck'
require './lib/item'
require './lib/event'

RSpec.describe Event do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @event = Event.new('South Pearl Street Farmers Market')
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
  end

  it 'exists and has attributes' do
    expect(@event).to be_a Event
    expect(@event.name).to eq('South Pearl Street Farmers Market')
    expect(@event.food_trucks).to eq([])
  end

  it 'can add a food truck to the event' do
    @event.add_food_truck(@food_truck1)

    expect(@event.food_trucks).to eq([@food_truck1])
  end

  it 'can return the names of all food trucks' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_truck_names).to eq([@food_truck1.name, @food_truck2.name, @food_truck3.name])
  end

  it 'can return the food trucks that sell a specific item' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
    expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
  end

  it 'can return the items that are overstocked' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.overstocked_items).to eq([@item1])
  end

  it 'can return the names of all items at an event' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.item_names).to eq([@item1.name, @item2.name, @item4.name, @item3.name])
  end

  it 'can return all items at an event with total quantity and food trucks that sell that item' do
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)

    expect(@event.total_inventory).to eq({
      @item1 => [100, [@food_truck1, @food_truck3]],
      @item2 => [7, [@food_truck1]],
      @item4 => [50, [@food_truck2]],
      @item3 => [25, [@food_truck2]]
      })
  end
end