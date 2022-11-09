require './lib/item'
require 'pry'

RSpec.describe Item do
  it 'item exists and has attributes' do
    item = Item.new({name: 'Peach Pie (Slice)', price: "$3:75"})

    expect(item).to be_instance_of(Item)
    expect(item.name).to eq("Peach Pie (Slice)")
  end
end