require 'bike.rb'

describe Bike do
	it "Should not be broken after we create it" do
		the_bike = Bike.new
		expect(the_bike).not_to be_broken
	end
end
