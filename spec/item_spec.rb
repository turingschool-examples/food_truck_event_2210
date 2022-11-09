require 'rspec'
require './lib/item'

describe Item do
  describe '#initialize' do
    it 'exists and has attributes' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item1).to be_a Item
      expect(item1.name).to eq 'Peach Pie (Slice)'
      expect(item1.price).to eq 3.75
    end
  end

  describe '#money_parse' do
    it 'looks through a string of money and returns an int' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expected = item1.money_parse('$3.75')

      expect(expected).to eq 3.75
      expect(expected.class).to eq Float
    end
  end
end