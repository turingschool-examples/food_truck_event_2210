require './lib/item'

RSpec.describe Item do
  before :each do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists and has attributes' do
    expect(@item1).to be_a Item
    expect(@item1.name).to eq('Peach Pie (Slice)')
  end

  it 'can return the price as a float' do
    expect(@item1.price).to eq(3.75)
  end
end