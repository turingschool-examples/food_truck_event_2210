require './lib/item'

RSpec.describe Item do
  it 'exists' do
    item = Item.new({name: 'Pumpkin Pie (Slice)', price: '$1.99'})

    expect(item).to be_a Item
  end
end
