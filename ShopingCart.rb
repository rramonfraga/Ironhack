require 'pry'

class Item
  attr_reader :name, :price
  def initialize name, price
    @name = name
    @price = price
  end

  def spring_price
    @price
  end  
  def summer_price
    @price
  end
  def autumn_price
    @price
  end
  def winter_price
    @price
  end
  def sunday_price
    @price
  end
end

class Apple < Item
  def initialize
   super :apples, 10
  end
  def autumn_price
    @price + 5
  end
  def winter_price
    @price +2
  end

end

class Orange < Item
  def initialize
   super :oranges, 5
  end
  def summer_price
    @price - 3
  end
end

class Grape < Item
  def initialize
   super :grapes, 15
  end
end

class Banana < Item
  def initialize
   super :bananas, 20
  end
  def winter_price
    @price +1
  end
end

class Watermelon < Item
  def initialize
   super :watermelon, 50
  end
  def sunday_price
    2*@price
  end
end





class ShoppingCart
  def initialize items
    @items = items
    @cart = []
  end

  def find_item item_name
    @cart.find do |item|
      item.name == item_name
    end
  end

  def add_item_to_cart item_name
    @cart.push @items[item_name].new
  end

  def select_the_sames item_name
    @cart.select do |item|
      item.name == item_name
    end
  end

  def summary_the_same item_name
    same_items = select_the_sames item_name
    same_items.reduce(0) do |sum, item|
      sum + item.price
    end
  end

  def list_the_item
    list = []
    @cart.each do |item|
      if !(list.find{|list_item| list_item == item.name})
        list.push item.name
      end
    end
    list
  end

  def show
    list_the_item.each do |item|
      puts "#{select_the_sames(item).size}. #{item}: #{summary_the_same item}$ "
    end 
  end

  def cost
    price_total = 0
    #@cart.each do |item|
      #price_total = price_total + item.price
    #end
    puts "The price total is: #{price_total}$"
  end
end





fruits = {
  apples: Apple,
  oranges: Orange,
  grapes: Grape,
  banana: Banana,
  watermelon: Watermelon
}

cart = ShoppingCart.new fruits

cart.add_item_to_cart :apples
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.show
cart.cost