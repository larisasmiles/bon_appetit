require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require 'pry'

class PantryTest < Minitest::Test

  def test_if_it_exists
    p = Pantry.new

    assert_instance_of Pantry, p
  end

  def test_if_it_returns_stock_as_a_hash
    p = Pantry.new
    p.stock

    assert_equal ({}), p.stock
  end

  def test_if_it_stock_checks
    p = Pantry.new
    p.stock
    p.stock_check("cheese")

    assert_equal 0, p.stock_check("cheese")
  end

  def test_if_it_returns_stock_amount
    pantry = Pantry.new
    pantry.stock
    pantry.restock("cheese", 10)

    assert_equal 10, pantry.stock_check("cheese")
  end

  def test_if_it_restocks_and_adds_new_stock
    pantry = Pantry.new
    pantry.stock
    pantry.stock_check("cheese")
    pantry.restock("cheese", 10)
    pantry.restock("cheese", 20)

    assert_equal 30, pantry.stock_check("cheese")
  end

  def test_if_it_converts_to_centi_units
    skip
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)
    pantry = Pantry.new
    pantry.convert_units(r)
    assert_equal ({"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
    "Cheese" => {quantity: 75, units: "Universal Units"},
    "Flour" => {quantity: 5, units: "Centi-Units"}}), pantry.convert_units(r)
  end

  def test_add_to_recipe
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")

    assert_equal ({}), r.ingredients

    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients
  end

  def test_what_can_I_make
    skip
    pantry = Pantry.new
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    r2 = Recipe.new("Brine Shot")
    r2.add_ingredient("Brine", 10)
    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)
    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)

    assert_equal r1, pantry.add_to_cookbook("Cheese Pizza")
    assert_equal r2, pantry.add_to_cookbook("Brine Shot")
    assert_equal r3, pantry.add_to_cookbook("Peanuts")
  end
end
