require './lib/event'
require './lib/food_truck'
require './lib/item'

RSpec.describe Event do
  let!(:event) {Event.new("South Pearl Street Farmers Market")}
  let!(:food_truck1) {FoodTruck.new("Rocky Mountain Pies")}
  let!(:food_truck2) {FoodTruck.new("Ba-Nom-a-Nom")}
  let!(:food_truck3) {FoodTruck.new("Palisade Peach Shack")}
  let!(:item1) {Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})}
  let!(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let!(:item3) {Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'})}
  let!(:item4) {Item.new({name: 'Banana Nice Cream', price: '$4.25'})}

  it 'starts with a name and an empty food trucks array' do
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq([])
    expect(event).to be_a Event
  end
  
  it 'can add food trucks' do
    expect(event.food_trucks).to eq([])
    event.add_food_truck(food_truck1)
    
    expect(event.food_trucks).to eq([food_truck1])
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    
    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end
  
  it 'knows the food truck names' do
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    
    expect(event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end
  
  it 'knows the food trucks that sell a specific item' do
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item3, 25)
    food_truck2.stock(item4, 50)
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    
    expect(event.food_trucks_that_sell(item1)).to eq [food_truck1, food_truck3]
    expect(event.food_trucks_that_sell(item4)).to eq [food_truck2]
  end  
  
  it 'can find potential revenue for more trucks' do # tested singularly in food_truck_spec, but this adheres to the interaction pattern
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2.stock(item3, 25)
    food_truck2.stock(item4, 50)
    food_truck3.stock(item1, 65)
    
    expect(food_truck1.potential_revenue).to eq(148.75) 
    expect(food_truck2.potential_revenue).to eq(345.00) 
    expect(food_truck3.potential_revenue).to eq(243.75) 
  end
  
  describe 'Iteration3' do
    before(:each) do
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)
      food_truck2.stock(item3, 25)
      food_truck2.stock(item4, 50)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
    end

    it 'returns a list of all items (helper)' do
      expect(event.list_all_items).to eq([item1, item2, item3, item4])
    end

    it 'returns the total quantity of an item (helper)' do
      expect(event.total_quantity_of_item(item1)).to eq(100)
    end

    it 'knows overstocked_items at the event' do
      expect(event.overstocked_items).to eq([item1])
    end
    
    it 'knows the names of all items at the event, sorted alphabetically' do
      expect(event.names_of_all_items).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end

    it 'knows the total inventory of items, and which trucks sell the item' do
      expect(event.total_inventory).to eq({
        item1 => [100, [food_truck1, food_truck3]],
        item2 => [7, [food_truck1]],
        item3 => [25, [food_truck2]],
        item4 => [50, [food_truck2]]
      })
    end
  end
end