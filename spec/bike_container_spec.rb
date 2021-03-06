require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end


describe BikeContainer do
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }


	def fill_holder(holder)
		holder.capacity.times { holder.dock(bike) }
	end

	it "should accept a bike" do
		# we expect the station to have 0 bikes
		expect(holder.bike_count).to eq(0)
		# let's dock a bike into the station
		holder.dock(bike)
		# now we expect the station to have 1 bike
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when if it's full" do
		expect(holder).not_to be_full
		fill_holder(holder)
		expect(holder).to be_full
	end

	it "should not accpet a bike if it's full" do
		fill_holder(holder)
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end


	it "should provide the list of broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it "Should raise an error if someone tries to take a bike from an empty holder" do
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
		holder.release(bike)
		expect(lambda {holder.empty?}).to raise_error(RuntimeError)
		expect(holder.bike_count).to eq(0)
	end
		
	

end