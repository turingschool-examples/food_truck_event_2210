# frozen_string_literal: true

# This is the Item Class
class Item

  attr_reader :name

  def initialize(args)
    @name  = args[:name]
    @price = args[:price]
  end

  def price
    @price.delete('$').to_f
  end
end
