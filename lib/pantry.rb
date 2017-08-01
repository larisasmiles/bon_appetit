class Pantry
    attr_reader :stock, :cookbook
  def initialize
    @stock = Hash.new(0)
    @cookbook = {}
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, amount)
    stock[item] += amount
  end

  def convert_units(recipe)
     recipe.ingredients.each_pair do  |item, amount|
       if item.to_f < 1
         "Milli-Units"
       elsif item.to_f > 1 && item < 100
         "Universal Units"
       elsif item.to_f > 100
         "Centi-Units"
       end
     end
  end

  def add_to_cookbook(recipe)
    recipe.ingredients.each do |item, amount|
      @cookbook[recipe] += amount
    end
  end


end
