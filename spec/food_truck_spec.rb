require './lib/item'
require './lib/food_truck'


RSpec.describe FoodTruck do
  describe '#initialize' do
    it 'exists' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_a(FoodTruck)
    end
  end

  it 'has atrributes' do 
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(item1.name).to eq('Peach Pie (Slice)')
    expect(item1.price).to eq("$3.75")
    expect(item2.name).to eq('Apple Pie (Slice)')
    expect(item2.price).to eq('$2.50')
  end

  it 'adds check stock' do 
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(food_truck.check_stock(item).to eq(0)
  end

  it 'stocks items' do 
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      
    expect(food_truck.stock(item, amount)).to eq()

    food_truck.stock(item1, 30)

    expect(food_truck.stock(item, amount)).to eq(item1, 30)
  end
    

  it 'includes inventory' do 
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    
    food_truck.stock(item1, 30)
    food_truck.stock(item2, 12)

    expect(food_truck.inventory).to eq(item1, item2)
  end
end
