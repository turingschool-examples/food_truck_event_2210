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
end
