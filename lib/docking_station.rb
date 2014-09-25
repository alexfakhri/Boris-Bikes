require_relative 'bike_container'

class DockingStation

	include BikeContainer


	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end


	def accept_fixed_bikes(van)
		van.available_bikes.each do |bike|
			@bikes << van.release(bike)
		end
	end

	def empty!(station)
		@bikes == 0
	end


end