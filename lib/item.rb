class Item
  attr_reader :info, :stock

  def initialize(info)
    @info = info
    @stock = 0
  end
end
