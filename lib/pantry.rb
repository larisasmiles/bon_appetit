# pantry = Pantry.new
# # => <Pantry...>
# # Checking and adding stock
# pantry.stock
# # => {}
# pantry.stock_check("Cheese")
# # => 0
# pantry.restock("Cheese", 10)
# pantry.stock_check("Cheese")
# # => 10
# pantry.restock("Cheese", 20)
# pantry.stock_check("Cheese")
# # => 30
class Pantry
    attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, amount)
    @stock[item] += amount
  end
end
