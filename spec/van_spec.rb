require 'van'
require 'docking_station'
require 'bike_container_spec'
require 'bike'

describe Van do

	include BikeContainer

	let(:van) { Van.new(:capacity => 10) }

	it "should have a default capacity on initialising" do
		expect(van.capacity).to eq(10)
	end






end