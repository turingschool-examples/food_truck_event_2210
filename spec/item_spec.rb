# frozen_string_literal: true

require 'rspec'
require './lib/item'

describe Item do
  describe '#initialize' do
    it 'exists and has attributes' do
      item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      expect(item).to be_instance_of(Item)
      expect(item.name).to eq('Peach Pie (Slice)')
      expect(item.price).to eq(3.75)
    end
  end
end