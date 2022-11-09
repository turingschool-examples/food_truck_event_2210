require './lib/item'
require './lib/food_truck'

RSpec.describe do
  it 'exists' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    expect(food_truck).to be_a(FoodTruck)
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to be_a Hash
    expect(food_truck.check_stock(item1)).to eq 0
  end

  describe '#check_stock' do
    it 'returns stock level' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq 0
      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq 30
    end
  end

  describe '#stock' do
    it 'can add stock to inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq 0
      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq 30
    end
  end

  describe '#potential_revenue' do
    it 'calculates the potential revenue of all the items being sold' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      event.add_food_truck(food_truck1)
      food_truck1.stock(item1, 35)
      food_truck1.stock(item2, 7)

      expect(food_truck1.potential_revenue).to eq 148.75
    end
  end
end