require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  let!(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let!(:item_1) {Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})}
  let!(:item_2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'starts with a name and empty inventory hash' do
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
    expect(food_truck).to be_a(FoodTruck)
  end
  
  it 'can have items added with a stock method' do
    expect(food_truck.check_stock(item_1)).to eq(0)
    
    food_truck.stock(item_1, 30)
    
    expect(food_truck.inventory).to eq({item_1 => 30})
    expect(food_truck.check_stock(item_1)).to eq(30)
  end
  
  it 'adds more stock if same item is added' do
    food_truck.stock(item_1, 30)
    
    expect(food_truck.inventory).to eq({item_1 => 30})
    
    food_truck.stock(item_1, 25)
    
    expect(food_truck.inventory).to eq({item_1 => 55})
    
    food_truck.stock(item_2, 12)
    
    expect(food_truck.inventory).to eq({item_1 => 55, item_2 => 12})
  end
  
  it 'can calculate the total possible revenue (stock * price)' do 
    food_truck.stock(item_1, 30)
    food_truck.stock(item_1, 25)
    food_truck.stock(item_2, 12)
    
    expect(food_truck.potential_revenue).to eq(236.25)
  end
  
  it 'removes item from stock if sold' do
    food_truck.stock(item_1, 30)
    expect(food_truck.check_stock(item_1)).to eq(30)
    
    food_truck.sell(item_1, 20)
    expect(food_truck.check_stock(item_1)).to eq(10)
    
  end

end
