require 'pry'
require './lib/item'

RSpec.describe Item do
  describe '#iteration 1' do
    let(:item1){Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2){Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    
    it 'exists and has readable attributes' do
      expect(item1).to be_a(Item)
      expect(item2).to be_a(Item)
      expect(item1.name).to eq('Peach Pie (Slice)')
      expect(item2.name).to eq('Apple Pie (Slice)')
      expect(item1.price).to eq('$3.75')
      expect(item2.price).to eq('$2.50')
    end
    
    it 'can convert string value to integer' do
      expect(item1.cost).to eq(3.75)
    end
  end
end
