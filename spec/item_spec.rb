require './lib/item'

RSpec.describe Item do
  it 'exists' do
    item = Item.new({ name: 'Pumpkin Pie (Slice)', price: '$1.99' })

    expect(item).to be_a Item
  end

  it 'has a name and a price' do
    item = Item.new({ name: 'Pumpkin Pie (Slice)', price: '$1.99' })

    expect(item.name).to eq('Pumpkin Pie (Slice)')
    expect(item.price).to eq('$1.99')
  end

  describe '#price_to_float' do
    it 'turns the string price into a float' do
      item = Item.new({ name: 'Pumpkin Pie (Slice)', price: '$1.99' })

      expect(item.price_to_float).to eq(1.99)
    end
  end
end
