class Customer

attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age, drunkenness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = drunkenness
  end

  def sufficient_funds?(drink)
    @wallet >= drink.price
    #   return true
    # else
    #   return false
    # end
  end

  def legal_age?
    @age >= 18
  end

  def pay_for_drink(drink)
    @wallet -= drink.price
  end

  def increase_alcohol_level(drink)
    @drunkenness += drink.alcohol_level
  end

  def over_limit?(limit)
    if limit <= 10 && @drunkenness <=10
      return true
    else
      return false
    end
  end



end
