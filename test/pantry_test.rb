require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
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

  def test_if_it_restocks
    p = Pantry.new
    p.stock
    p.restock("cheese", 10)

    assert_equal 10, p.stock_check("cheese")
  end

  def test

  end
end
