require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  let(:event) { Event.new('Catalina Wine Mixer')}

  it 'exists and has a name' do
    expect(event).to be_a Event
    expect(event.name).to eq('Catalina Wine Mixer')
  end

  it 'starts without any food trucks' do
    expect(event.food_truck).to eq([])
  end
end
