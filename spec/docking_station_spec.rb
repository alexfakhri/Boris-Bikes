require 'docking_station'
require 'bike_container_spec'

describe DockingStation do

	include BikeContainer;

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 40) }
	let(:van) { Van.new }

	it "should allow setting default capacity on initialising" do
	    expect(station.capacity).to eq(40)
	end

	it "Should be able to accept fixed bikes from van" do
		van.dock(bike)
		expect{station.accept_fixed_bikes(van)}.to change{van.bike_count}.by -1
	end

	
end