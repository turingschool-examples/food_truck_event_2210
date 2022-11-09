require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do 
  describe '#initialize' do 
    it 'will exist and have attributes' do 
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_a(FoodTruck)
      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end 
  end 

  describe "#chekc_stock" do 
    it 'will check stock of an item' do 
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach pie (slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq(0)

    end 
  end 
end