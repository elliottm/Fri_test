require 'dishes'

describe Dishes do

let(:dish) { Dishes.new }
  
  it 'does not have a price' do
  	expect(dish).not_to have_price
  end

  it 'has a price' do
  	price = double :price
  	dish.assign_price price
  	expect(dish).to have_price
  end

  it 'can be added to takeaway list of dishes' do
    #interaction test only, outcome takeaway class
    takeaway = double :takeaway
    expect(takeaway).to receive(:add_dish_to_menu)
    dish.add_to_menu takeaway
  end

end
