require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let(:event) { Event.new('South Pearl Street Farmers Market') }

  let(:food_truck1) { FoodTruck.new('Rocky Mountain Pies')}
  let(:food_truck2) { FoodTruck.new('Ba-Nom-a-Nom')}
  let(:food_truck3) { FoodTruck.new('Buns-a-lot')}
  let(:food_truck4) { FoodTruck.new('Tacos')}

  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }
  let(:item3) { Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30' }) }
  let(:item4) { Item.new({ name: 'Banana Nice Cream', price: '$4.25' }) }

  describe '#initialize' do
    it 'exists' do
      expect(event).to be_a(Event)
      expect(event.name).to eq('South Pearl Street Farmers Market')
      expect(event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck()' do
    it 'adds a food truck to the event' do
      expect(event.food_trucks).to eq([])

      event.add_food_truck(food_truck1)
      expect(event.food_trucks).to eq([food_truck1])

      event.add_food_truck(food_truck2)
      expect(event.food_trucks).to eq([food_truck1, food_truck2])
    end
  end
  
  describe '#food_truck_names' do
    it 'returns a collection of food truck names at event' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)

      expect(event.food_truck_names).to eq(['Rocky Mountain Pies', 'Ba-Nom-a-Nom'])
    end
  end

  describe '#food_trucks_that_sell()' do
    it 'returns a list of food trucks with item in stock' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)

      food_truck1.stock(item1, 20)
      food_truck1.stock(item2, 25)
      food_truck2.stock(item3, 20)
      food_truck2.stock(item3, 20)

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1])
    
      food_truck2.stock(item1, 20)
      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck2])

      expect(event.food_trucks_that_sell(item4)).to eq([])
    end
  end

  describe '#overstocked_items' do
    it 'returns a list of items in > 1 truck and count > 50' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      event.add_food_truck(food_truck4)

      food_truck1.stock(item1, 20)
      food_truck1.stock(item2, 20)
  
      expect(event.overstocked_items).to eq([])

      food_truck1.stock(item1, 45)
      food_truck2.stock(item1, 20)

      expect(event.overstocked_items).to eq([item1])

      food_truck1.stock(item2, 45)
      food_truck2.stock(item2, 20)

      expect(event.overstocked_items).to eq([item1, item2])
    end
  end

  describe '#available_item_names' do
    it 'lists all names of available items at event alphabetically' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)

      expect(event.available_item_names).to eq([])

      food_truck1.stock(item1, 20)
      food_truck1.stock(item2, 20)
      expect(event.available_item_names).to eq(['Apple Pie (Slice)', 'Peace Pie (Slice)'])

      food_truck2.stock(item3, 45)
      food_truck3.stock(item3, 45)
      food_truck4.stock(item4, 45)

      expect(event.available_item_names).to eq(['Apple Pie (Slice)', 'Banana Nice Cream' 'Peach-Raspberry Nice Cream', 'Peach Pie (Slice)'])
    end
  end

  describe '#total_event_inventory' do
    it 'returns a hash of total event inventory' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      event.add_food_truck(food_truck4)

      food_truck1.stock(item1, 20)
      food_truck1.stock(item2, 20)
      food_truck2.stock(item3, 45)
      food_truck3.stock(item4, 20)
      food_truck3.stock(item2, 45)
      food_truck4.stock(item2, 20)

      expect(event.total_event_inventory).to eq({})
    end
  end
end