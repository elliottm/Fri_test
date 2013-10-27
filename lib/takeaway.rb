require_relative 'text'

class Takeaway

include Text

  def initialize 
    @menu = []
    @orders = []
  end

  attr_reader :orders, :menu

	def add_dish_to_menu dish
		@menu << dish
	end
  
  def menu_count
    @menu.count
  end

  def orders_count
    @orders.count
  end

  def add_new_order customer
  	#valid order control within customer
  	@orders << customer
  	send_message(customer_message, customer)
  end

  def complete_order customer
  	customer.confirm_order_complete
  end

  def print_menu
    @menu.each {|dish| puts dish }
  end

  def customer_message
  	"Ahoy dick, order received.  Your food should be with you by #{delivery_time}"
  end

  def delivery_time
  	time_now_plus_one_hr = Time.now + 60*60
  	time_now_plus_one_hr.strftime("%Y-%m-%d %H:%M:%S")
  end

end