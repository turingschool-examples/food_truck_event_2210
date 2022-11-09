require './lib/event'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")
    expect(event).to be_instance_of(Event)
    expect(event.name).to eq("South Pearl Farmers Market")
    expect(event.food_trucks).to eq([])
  end

  it '#add_food_truck to event' do
  end

  it '#food_truck_names returns list of names for event' do
  end

  it '#food_trucks_that_sell Return the list of FoodTrucks that sell a given Item for an Event' do
  end

  it '#potential_revenue from a FoodTruck' do
    expect(event.food_truck_names).to be_a(Array)
  end
end
