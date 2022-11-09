require './lib/item'

RSpec.describe Item do
  it '#exists' do
    expect(item1).to be_an_instance_of(Item)
  end
end
