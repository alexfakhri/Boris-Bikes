require 'docking_station'
require 'bike_container_spec'

describe DockingStation do

	include BikeContainer;

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }

	it "should allow setting default capacity on initialising" do
	    expect(station.capacity).to eq(20)
	end

	
end