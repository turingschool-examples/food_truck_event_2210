class Item
  attr_reader :name,
              :price
              
  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def money_parse(string)
    string.gsub(/[^\d\.]/, '').to_f
  end
end
