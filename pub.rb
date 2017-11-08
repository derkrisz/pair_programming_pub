class Pub

attr_reader :name, :drinks, :till, :limit

  def initialize(name, drinks, till, limit)
    @name = name
    @drinks = drinks
    @till = till
    @limit = limit
  end


  def drink_exists?(drink_name)
    for drink in @drinks
      if drink_name == drink.name
        return drink
      end
    end
    return nil
  end

  def sell_drink(drink_name, customer)
    drink = drink_exists?(drink_name)
    return if drink == nil
    return if !customer.sufficient_funds?(drink)
    return if !customer.legal_age?()
    return if !customer.over_limit?(@limit)
    @till += drink.price
    customer.pay_for_drink(drink)
  end

end
