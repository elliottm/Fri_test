require_relative 'exceptions'

class Customer

	def initialize
		@order = []
	end

	attr_reader :order, :address, :phone
	attr_accessor :confirm_order_complete

	def assign_address address
	  @address = address
	end

	def assign_number number
      @phone = number
	end

	def order_count
      @order.count
	end

	def has_valid_order?
      raise NoAddressError if @address.nil?
      raise NoPhoneError if @phone.nil?
      true
	end

	def add_dish_to_order dish
	  @order << dish
	end

	def print_items_in_order
      puts "Your items ordered: #{self.order}"
      return true
	end

	def add_order_to takeaway
	  has_valid_order?
	  takeaway.add_new_order self
	  @order_submitted = true
	end

	def total_price_of_order
	  #  need to refactor in line with task1.
	  # order.each do |dish|
	  	#sum = 0
	  	#accumulator = dish.price + dish.price
	  	#sum += accumulator
	  	#puts "£#{sum}"
      total_prices = order.map { |dish| dish.price }
      total_price = total_prices.inject {|memo, price| memo + price }
      return "Your total price: £#{total_price}"
	end

	def has_submitted_order?
      @order_submitted
	end

	def has_completed_order?
      @completed_order
	end

	def confirm_order_complete
	  @completed_order = true
	end

end
