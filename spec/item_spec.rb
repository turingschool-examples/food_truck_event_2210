require './lib/item'

RSpec.describe 'item' do
  it 'exists' do 
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

    expect(item1).to be_a(Item)
    expect(item1.info[:name]).to eq('Peach Pie (Slice)')
    expect(item1.info[:price]).to eq("$3.75")
    expect(item1.stock).to eq(0)
    expect(item2).to be_a(Item)
    expect(item2.info[:name]).to eq('Apple Pie (Slice)')
    expect(item2.info[:price]).to eq('$2.50')
    expect(item2.stock).to eq(0)
  end
end