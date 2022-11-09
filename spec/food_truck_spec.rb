require './lib/food_truck'

RSpec.describe FoodTruck do
  it 'exists' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')

    expect(food_truck).to be_instance_of(FoodTruck)
    expect(food_truck.name).to eq('Rocky Mountain Pies')
    expect(food_truck.inventory).to eq({})
  end

  it '#check_stock' do
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })

    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it '#stock add items to inventory' do
  food_truck = FoodTruck.new('Rocky Mountain Pies')
    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    food_truck.stock(item1, 30)
    expect(food_truck.inventory.values).to be_a(Array)
    expect(food_truck.check_stock(item1)).to eq(30)
    food_truck.stock(item1, 25)
    expect(food_truck.check_stock(item1)).to eq(55)
    food_truck.stock(item2, 12)
    expect(food_truck.inventory.values).to eq([55, 12])
  end

  it '#potential_revenue the sum of all their items price * quantity.' do
end
end
