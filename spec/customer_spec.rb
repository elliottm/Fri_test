require 'customer'

describe Customer do

let(:customer) { Customer.new }

  it 'can assign address' do
    customer.assign_address :address
    expect(customer.address).not_to eq nil
  end

  it 'can assign phone number' do
    customer.assign_number :number
    expect(customer.phone).not_to eq nil
  end

  it 'has no order' do
    expect(customer.order_count).to eq 0
  end

  it 'can add dish to order' do
    customer.add_dish_to_order :dish
    expect(customer.order_count).to eq 1
  end

  #How to test for??  Added above to acknowledge print being true, doubt robust?

  it 'can print items in order' do
    customer.add_dish_to_order :dish
    expect(customer.print_items_in_order).to be_true
  end

  it 'has an invalid order' do
    takeaway = double :takeaway
    expect(lambda {customer.add_order_to(takeaway)} ).to raise_error(NoAddressError)
  end

  it 'has a valid order' do
    #how to refactor below command?
    #which will include other environment setting commands as well..
    customer.assign_address 'address'
    customer.assign_number 'number'
    customer.add_dish_to_order :dish
    expect(customer).to have_valid_order
  end

  # it 'raises an error if invalid order added to takeaway'
  #   expect(lambda { customer.add_order_to takeaway } ).to raise_error(RuntimeError)
  # end

  it 'can tell you total price of order' do
    dish = double :dish
    expect(dish).to receive(:price)
    customer.add_dish_to_order dish
    expect(customer.total_price_of_order).to start_with "Your total"
    #better way to write test?
  end

  it 'places order with the takeaway' do
    #intereaction test below..
    customer.assign_address 'address'
    customer.assign_number 'number'
    takeaway = double :takeaway
    expect(takeaway).to receive(:add_new_order)
    customer.add_order_to takeaway
  end

  it 'has an order after placing' do
    #outcome test of above intereaction..
    customer.assign_address 'address'
    customer.assign_number 'number'
    takeaway = double :takeaway, {:add_new_order => :true}
    customer.add_order_to takeaway
    expect(customer).to have_submitted_order
  end

  it 'can tell you if order is complete/delivered' do
    customer.confirm_order_complete
    expect(customer).to have_completed_order
  end


end

