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
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    same_foods = food_trucks.find_all { |truck| truck.inventory.include?(item) }
      same_foods
  end

  def sorted_item_list
    array = @food_trucks.map { |truck| truck.inventory.keys }.flatten.uniq
    array.sort_by { |item| item.name }
  end

  def overstocked_items
    # require "pry";binding.pry
  end

  def total_inventory
    total_inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if total_inventory[item].nil?
            total_inventory[item] = {quantity: quantity, food_trucks: [truck]}
        else
          total_inventory[item][:quantity] += quantity
          total_inventory[item][:food_trucks] << truck
        end
      end
    end
    total_inventory
  end


end
