require './lib/food_truck'

RSpec.describe FoodTruck do
    it 'exists' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")

        expect(food_truck).to be_instance_of(FoodTruck)
        expect(food_truck.name).to eq("Rocky Mountain Pies")
        expect(food_truck.inventory).to eq({})
    end

    it '#check_stock' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        expect(food_truck.check_stock(item1)).to eq(0)

end
        # #=> 0
        # food_truck.stock(item1, 30)
        # food_truck.inventory
        # #=> {#<Item:0x007f9c56740d48...> => 30}
        # food_truck.check_stock(item1)
        # #=> 30
        # food_truck.stock(item1, 25)
        # food_truck.check_stock(item1)
        # #=> 55
        # food_truck.stock(item2, 12)
        # food_truck.inventory
        # #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}    end
end