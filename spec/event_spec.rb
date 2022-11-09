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
end
