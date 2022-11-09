require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let(:event) { Event.new('Catalina Wine Mixer')}
  let(:ft1) {FoodTruck.new('Rock Springs Cafe')}
  let(:ft2) {FoodTruck.new('Press Coffee')}
  let(:it1) {Item.new({name: 'Pumpkin Pie (Slice)', price: '$1.99'})}
  let(:it2) {Item.new({name: 'Rhubarb Pie (Slice)', price: '$0.99'})}
  let(:it3) {Item.new({name: 'Latte', price: '$4.99'})}
  let(:it4) {Item.new({name: 'Cortado', price: '$2.99'})}

  it 'exists and has a name' do
    expect(event).to be_a Event
    expect(event.name).to eq('Catalina Wine Mixer')
  end

  it 'starts without any food trucks' do
    expect(event.food_trucks).to eq([])
  end

  describe '#add_food_truck()' do
    it 'adds a food truck to the event' do
      event.add_food_truck(ft1)

      expect(event.food_trucks).to eq([ft1])

      event.add_food_truck(ft2)

      expect(event.food_trucks).to eq([ft1, ft2])
    end
  end

  describe '#food_truck_names' do
    it 'returns an array of the food truck names at the event' do
      event.add_food_truck(ft1)
      event.add_food_truck(ft2)

      expect(event.food_truck_names).to eq(['Rock Springs Cafe', 'Press Coffee'])
    end
  end

  describe '#food_trucks_that_sell()' do
    it 'returns array of food trucks that sell the given item' do
      event.add_food_truck(ft1)
      event.add_food_truck(ft2)
      ft1.stock(it1, 20)
      ft1.stock(it2, 30)
      ft1.stock(it3, 20)
      ft2.stock(it1, 4)
      ft2.stock(it3, 100)
      ft2.stock(it4, 70)

      expect(event.food_trucks_that_sell(it2)).to eq([ft1])
      expect(event.food_trucks_that_sell(it4)).to eq([ft2])
      expect(event.food_trucks_that_sell(it3)).to eq([ft1, ft2])
    end
  end

  describe '#overstocked_items' do
    xit 'returns a list of items sold by more than one truck and qty is >50' do
      expect(event.overstocked_items).to eq([])

      event.add_food_truck(ft1)
      event.add_food_truck(ft2)
      ft1.stock(it1, 20)
      ft1.stock(it2, 30)
      ft1.stock(it3, 20)
      ft2.stock(it1, 31)
      ft2.stock(it3, 10)
      ft2.stock(it4, 70)

      expect(event.overstocked_items).to include(it1)

      ft2.stock(it3, 12)

      expect(event.overstocked_items).to include(it1, it3)
    end
  end

  describe '#full_menu' do
    it 'returns a list of all items names available at event with no duplicates' do
      expect(event.full_menu).to eq([])

      event.add_food_truck(ft1)
      event.add_food_truck(ft2)
      ft1.stock(it1, 20)
      ft1.stock(it2, 30)
      ft1.stock(it3, 20)
      ft2.stock(it1, 4)
      ft2.stock(it3, 100)
      ft2.stock(it4, 70)

      expect(event.full_menu).to eq(['Cortado', 'Latte', 'Pumpkin Pie (Slice)', 'Rhubarb Pie (Slice)'])
    end
  end

  describe '#all_items' do
    it 'returns array of all items in event' do
      event.add_food_truck(ft1)
      event.add_food_truck(ft2)
      ft1.stock(it1, 20)
      ft1.stock(it2, 30)
      ft1.stock(it3, 20)
      ft2.stock(it1, 4)
      ft2.stock(it3, 100)
      ft2.stock(it4, 70)

      expect(event.all_items).to be_a Array
      event.all_items.each do |item|
        expect(item).to be_a Item
      end
      expect(event.all_items.uniq.size).to eq(event.all_items.size)
    end
  end

  describe '#all_items_hash' do
    it 'returns formatted hash with all items as keys to help total_inventory' do
      event.add_food_truck(ft1)
      event.add_food_truck(ft2)
      ft1.stock(it1, 20)
      ft1.stock(it2, 30)
      ft1.stock(it3, 20)
      ft2.stock(it1, 4)
      ft2.stock(it3, 100)
      ft2.stock(it4, 70)

      expect(event.all_items_hash).to be_a Hash
      event.all_items_hash.each do |key, value|
        expect(key).to be_a Item
        expect(value).to eq([0, []])
      end
    end
  end

  describe '#total_inventory' do
    it 'returns a hash with all items, each items quantity, and list of trucks selling the item' do
      expect(event.total_inventory).to eq({})

      event.add_food_truck(ft1)
      event.add_food_truck(ft2)
      ft1.stock(it1, 20)
      ft1.stock(it2, 30)
      ft1.stock(it3, 20)
      ft2.stock(it1, 4)
      ft2.stock(it3, 100)
      ft2.stock(it4, 70)

      expect(event.total_inventory).to eq({
        it1 => [24, [ft1, ft2]],
        it2 => [30, [ft1]],
        it3 => [120, [ft1, ft2]],
        it4 => [70, [ft2]]
        })
    end
  end
end
