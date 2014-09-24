require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def collect_broken_bikes(station)
		station.broken_bikes.each do |bike|
			@bikes << station.release(bike)
		end
	end

	def collect_available_bikes(garage)
		garage.available_bikes.each do |bike|
			@bikes << garage.release(bike)
		end
	end




end