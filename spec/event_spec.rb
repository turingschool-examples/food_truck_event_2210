require './lib/event'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_a(Event)
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq []
  end

end