require './lib/food_truck'
# require './lib/item'

describe FoodTruck do
  let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'exists and has attributes' do
    expect(food_truck).to be_a FoodTruck
    expect(food_truck.name).to eq("Rocky Mountain Pies")
    expect(food_truck.inventory).to eq({})
  end

  describe '#check_stock' do
    it 'returns the stock of an item, 0 by default' do
      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end

  describe '#stock' do
    it 'sets the stock of an item to a value' do
      food_truck.stock(item1, 30)

      expect(food_truck.check_stock(item1)).to eq(30)
    end
    
    it 'adds that item to the inventory hash' do
      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
      expect(food_truck.check_stock(item1)).to eq(30)

      food_truck.stock(item1, 25)

      expect(food_truck.check_stock(item1)).to eq(55)

      food_truck.stock(item2, 12)

      expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
    end
  end
end