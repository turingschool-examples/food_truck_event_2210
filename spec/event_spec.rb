require 'rspec'
require './lib/food_truck'
require './lib/item'
require './lib/event'

describe Event do
  describe '#initialize' do
    it 'exists and has attributes' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event).to be_a Event
      expect(event.name).to eq 'South Pearl Street Farmers Market'
      expect(event.food_trucks).to eq []
    end
  end
end