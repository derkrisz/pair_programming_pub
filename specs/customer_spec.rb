require('minitest/autorun')
require('minitest/rg')
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../drink.rb")



class TestCustomer < MiniTest::Test
  def setup
    @customer1 = Customer.new("John", 20, 30, 0)
    @drink = Drink.new("beer", 3, 2)
    @drink1 = Drink.new("cocktail", 21, 5)
  end

  def test_get_name
    assert_equal("John", @customer1.name)
  end

  def test_wallet
    assert_equal(20, @customer1.wallet)
  end

  def test_get_age
    assert_equal(30, @customer1.age)
  end

  def test_sufficient_funds__yes
    can_buy_drink = @customer1.sufficient_funds?(@drink)
    assert_equal(true, can_buy_drink)
    # assert_equal(17, @customer1.wallet)
  end

  def test_sufficient_funds__no
    can_buy_drink = @customer1.sufficient_funds?(@drink1)
    assert_equal(false, can_buy_drink)
  end

  def test_pay_for_drink
    @customer1.pay_for_drink(@drink)
    assert_equal(17, @customer1.wallet)
  end

  def test_increase_alcohol_level
    @customer1.increase_alcohol_level(@drink)
    assert_equal(2, @customer1.drunkenness)
  end





end
