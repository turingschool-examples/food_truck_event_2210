require './lib/item'

describe Item do
  let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}

  it 'exists and has attributes' do
    expect(item1).to be_a Item
    expect(item1.name).to eq('Peach Pie (Slice)')
    expect(item1.price).to eq("$3.75")
  end
end