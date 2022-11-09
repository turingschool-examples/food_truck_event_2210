require './lib/item'

RSpec.describe Item do
  let(:item1) { Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' }) }
  describe '#initialize' do
    it 'exists and has readable attributes' do
      expect(item1).to be_a Item
      expect(item1.name ).to eq 'Peach Pie (Slice)'
      expect(item1.price ).to eq '$3.75'
    end
  end

  describe '#price_to_f' do
    it 'converts string price to float' do
      expect(item1.price_to_f).to eq 3.75
    end
  end
end
