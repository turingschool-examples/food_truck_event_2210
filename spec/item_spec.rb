require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
  before (:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(@item2).to be_a(Item)
      expect(@item2.name).to eq("Apple Pie (Slice)")
      expect(@item2.price).to eq(2.50)
    end
  end
end