require 'van'
require 'docking_station'
require 'bike_container_spec'
require 'bike'
require 'docking_station'
require 'garage'

describe Van do

	class ContainerHolder; include BikeContainer; end

	let(:van) { Van.new(:capacity => 10) }
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }
	let(:garage) { Garage.new }

	it "should have a default capacity on initialising" do
		expect(van.capacity).to eq(10)
	end

	it "Should be able to pick up broken bikes from the docking station" do
		bike.break!
		station.dock(bike)
		expect{van.collect_broken_bikes(station)}.to change{station.bike_count}.by -1
	end
	
	it "Should be able to pick up fixed bikes from the garage" do
		bike.fix!
		garage.dock(bike)
		expect{van.collect_available_bikes(garage)}.to change{garage.bike_count}.by -1
	end


end