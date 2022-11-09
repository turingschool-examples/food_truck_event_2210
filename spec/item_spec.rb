require './lib/item'

describe Item do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}

  it 'exists and has attributes' do
    expect(item1).to be_a Item
    expect(item1.name).to eq('Peach Pie (Slice)')
    expect(item1.price).to eq("$3.75")
  end

  describe '#price_float' do
    it 'returns the price as a float' do
      expect(item1.price_float).to eq(3.75)
    end
  end
end