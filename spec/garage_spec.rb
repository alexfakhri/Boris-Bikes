require 'van'
require 'bike'
require 'bike_container'
require 'garage'



describe Garage do

	include BikeContainer;

	let(:van) { Van.new }
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }
	let(:garage) { Garage.new(:capacity => 200) }
	

	it "Accept broken bikes from van" do
		bike.break!
		van.dock(bike)
		expect(van.bike_count).to eq(1)
		expect{garage.receive_broken_bikes(van)}.to change{garage.bike_count}.by +1

	end

	it "should be able to fix broken bikes" do
		garage.receive_broken_bikes(van)
		garage.dock(bike)
		garage.fix_bikes(bike)
		garage.dock(bike)
	end



end