# frozen_string_literal: true

require 'rspec'
require './lib/item'

describe Item do
  describe '#initialize' do
    it 'exists' do
      item = Item.new
      expect(item).to be_instance_of(Item)
    end
  end
end