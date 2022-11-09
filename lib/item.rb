require 'bigdecimal'

class Item
  attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = to_price(info[:price])
  end

  def to_price(string)
    BigDecimal(string.delete('$'))
  end
end
