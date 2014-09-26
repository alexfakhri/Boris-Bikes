require 'person'
require 'docking_station'
require 'bike'

describe Person do
	
	let(:person) { Person.new }
	let(:bike) { Bike.new }
	let(:station) { DockingStation.new}

	it "Does not have a bike" do
		expect(person.not_have_a_bike(bike))
	end

	it "can rent a bike from the station available bikes" do
		allow(station).to receive(:release).with(bike).and_return(bike)
		person.rent_available_bike(station)
		expect(station.bike_count).to eq (0)
		expect(person.to_have_a_bike(bike))


	end

	it "can return a rented bike to the station" do
		expect(person.to_have_a_bike(bike))
		station.dock(bike)
		expect(person.not_have_a_bike(bike))
	end

	it "Can break a bike if they have an accident" do
		expect(bike).to receive(:break!)
		person.has_accident(bike)
	end


end