class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    # require 'pry'; binding.pry
    if inventory.keys.any? do |key|
        key = item
        puts key.value
      end
    else
      0
    end
  end

  def stock(item, amount)
    amount = inventory[:item]
  end
end
