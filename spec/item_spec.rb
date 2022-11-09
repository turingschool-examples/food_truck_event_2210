require './lib/item'

RSpec.describe Item do
  it 'exists with attributes' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    expect(item1).to be_a (Item)
    expect(item1.name).to eq ('Peach Pie (Slice)')
    expect(item2.price).to eq (2.50)
  end
end