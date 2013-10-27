require 'takeaway'

describe Takeaway do

let(:takeaway) { Takeaway.new }
let(:customer) { double = :customer }
let(:dish) { double = :dish }

  it 'has no menu dishes' do
  	expect(takeaway.menu_count).to eq 0
  end

  it 'has one menu dish' do
  	takeaway.add_dish_to_menu dish
  	expect(takeaway.menu_count).to eq 1
  end

  it 'can list the menu' do
  	takeaway.add_dish_to_menu dish
  	expect(takeaway.print_menu).to eq [:dish]
  end
  #is this actually a test?

  it 'has no order' do
  	expect(takeaway.orders_count).to eq 0
  end

  it 'has one order' do
  	#when i added message functionality to add_new_order method,
  	#test failed based on undefined phone for customer symbol.
  	takeaway.stub(:send_message)
    takeaway.add_new_order customer
    expect(takeaway.orders_count).to eq 1
  end

  it 'can calculate the current time plus one hour' do
    expect(takeaway.delivery_time).to eq (Time.now + 60*60).strftime("%Y-%m-%d %H:%M:%S")
  end
  
  it 'can send a text when order received' do
  	#works ... but do not understand how really ...
  	takeaway.stub(:send_message).and_return("Ahoy dick, order received.  Your food should be with you by 00.00")
  	expect(takeaway.add_new_order(customer)).to eq "Ahoy dick, order received.  Your food should be with you by 00.00"
  end

  it 'can set order as completed' do
  	customer = double :customer
  	expect(customer).to receive(:confirm_order_complete)
  	takeaway.complete_order customer
  end


end

