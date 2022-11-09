require './lib/item'

RSpec.describe Item do
  let(:item) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  let(:item2) { Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' }) }

  describe '#initialize' do
    it 'exists' do
      expect(item).to be_a(Item) 
      expect(item.name).to eq('Peach Pie (Slice)') 
      expect(item.price).to eq(3.75) 
      expect(item2.price).to eq(2.50) 
    end
  end
end