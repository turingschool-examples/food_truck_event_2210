require './lib/event'

RSpec.describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_a(Event)
    expect(event.name).to eq("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq []
  end

  describe '#add_food_truck' do
    it 'will add food trucks to the empty array' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      
      event.add_food_truck(food_truck1)
      expect(event.food_trucks).to eq [food_truck1]

      event.add_food_truck(food_truck2)
      expect(event.food_trucks).to eq [food_truck1, food_truck2]
    end
  end
end