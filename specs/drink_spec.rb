require('minitest/autorun')
require('minitest/rg')
# require_relative("../pub.rb")
require_relative("../drink.rb")

class TestDrink < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 3, 2)
  end

  def test_get_name
    assert_equal("beer", @drink1.name)
  end

  def test_get_price
    assert_equal(3, @drink1.price)
  end

end
