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

  describe "#check_stock" do 
    it 'will check stock of an item' do 
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach pie (slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq(0)

    end 
  end 

  describe "stock" do 
    it 'will add items to stock' do 
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach pie (slice)', price: "$3.75"})
      food_truck.stock(item1, 30)

      expect(food_truck.check_stock(item1)).to eq(30)
    end 
  end 
end