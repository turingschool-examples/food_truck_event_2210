require './lib/item'

RSpec.describe Item do
  it '#exists' do
    expect(item1).to be_an_instance_of(Item)
  end


  it 'has name' do
    expect(item1.name).to eq('Peach Pie(Slice)')
  end

  it 'has price' do
    expect(item1.price).to eq("$3.75")
  end
end
