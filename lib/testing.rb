require './dishes.rb'
require './customer.rb'
require './takeaway.rb'

rice = Dishes.new 
rice.assign_price 13
veg = Dishes.new
veg.assign_price 11
noodles = Dishes.new
noodles.assign_price 11
jo = Customer.new
jo.assign_address 'richmond'
jo.assign_number '0760262'

chinese = Takeaway.new
chinese.add_dish_to_menu rice
chinese.add_dish_to_menu veg
chinese.add_dish_to_menu noodles

jo.add_dish_to_order rice
jo.add_dish_to_order veg
jo.add_dish_to_order noodles

chinese.add_new_order jo




jo.print_items_in_order

jo.total_price_of_order

jo.confirm_order_complete



rice.add_to_menu ???

 jo.order.each do |dish|
 	sum = 0
   sum += dish.price
  end 
  puts sum
end

curl -X POST https://api.twilio.com/2010-04-01/Accounts/AC2a1e60fa3032eb15e951d00656ceccd6/SMS/Messages.json \
    -u AC2a1e60fa3032eb15e951d00656ceccd6:c9507e15ae94e5a53b6f60f7200ecea7 \
    -d "From=+441455561022" \
    -d "To=+447827960262" \
    -d 'Body=Hello Edward, welcome to Twilio!'
