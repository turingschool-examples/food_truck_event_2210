class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(check_item)
    trucks_with_item = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if item == check_item
          trucks_with_item << truck
        end
      end
    end
    trucks_with_item
  end

  # def overstocked_items
  #   overstocked = []
  #   @food_trucks.find_all do |truck|
  #     truck.inventory.each do |item, amount|
  #       if truck.inventory.include?(item)
  #         overstocked << truck
  #       end
  #       if overstocked.count > 1
  #
  #       end
  #     end
  #   end
  # end

  def inventory_sorted_alphabetically
    alphabetical_items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if truck.inventory.include?(item)
          alphabetical_items << item.name
        end
      end
    end
    alphabetical_items.sort.uniq
  end
end
