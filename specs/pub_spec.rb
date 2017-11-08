require('minitest/autorun')
require('minitest/rg')
require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../pub.rb")


class TestPub < MiniTest::Test

  def setup
    @customer = Customer.new("Alex", 20, 23, 1)
    @customer1 = Customer.new("Ruby", 30, 16, 11)
    @drink1 = Drink.new("beer", 3, 2)
    @drink2 = Drink.new("vodka", 5, 6)
    @drink3 = Drink.new("wine", 4, 4)
    @drink4 = Drink.new("water", 1, 0)
    @drink5 = Drink.new("gin", 5, 5)
    @all_drinks = [@drink1, @drink2, @drink3, @drink4, @drink5]
    @pub = Pub.new("Chancer", @all_drinks, 100, 10)
  end

  def test_get_name
    assert_equal("Chancer", @pub.name)
  end

  def test_get_drinks
    assert_equal(@all_drinks, @pub.drinks)
  end

  def test_stock_count
    assert_equal(5, @all_drinks.count)
  end

  def test_get_till
    assert_equal(100, @pub.till)
  end

  def test_customer_age__legal
    customer_legal = @customer.legal_age?
    assert_equal(true, customer_legal)
  end

  def test_customer_age__not_legal
    customer_legal = @customer1.legal_age?
    assert_equal(false, customer_legal)
  end

  def test_drink_exist
    assert_equal(@drink1, @pub.drink_exists?("beer"))
  end

  def test_doesnt_exist
    assert_nil(@pub.drink_exists?("rum"))
  end

  def test_can_serve_drink__drink_exists
    @pub.sell_drink("beer", @customer)
    assert_equal(103, @pub.till)
    # assert_equal(17, @customer.wallet)
  end

  def test_can_serve_drink__drink_doesnt_exist
    @pub.sell_drink("rum", @customer)
    assert_equal(100, @pub.till)
    assert_equal(20, @customer.wallet)
  end

  def test_drunkenness_level__under
    customer_drunk = @customer.over_limit?(@pub.limit)
    assert_equal(true, customer_drunk)
  end

  def test_drunkenness_level__over
    customer_drunk = @customer1.over_limit?(@pub.limit)
    assert_equal(false, customer_drunk)
  end



end
