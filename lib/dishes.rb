class Dishes

  def initialize price=nil
    @price = price
  end

  attr_accessor :price

  def has_price?
    return true if @price != nil
  end

  def assign_price price
    @price = price
  end

  def add_to_menu takeaway
    takeaway.add_dish_to_menu self
  end

end


