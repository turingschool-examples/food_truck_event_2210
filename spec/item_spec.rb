require './lib/item'

RSpec.describe Item do
  let!(:item_1) {Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})}
  let!(:item_2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}

  it 'starts with a name and a price' do
    expect(item_1.name).to eq('Peach Pie (Slice)')
    expect(item_1.price).to eq('$3.75')
    expect(item_1).to be_a(Item)
  end

end