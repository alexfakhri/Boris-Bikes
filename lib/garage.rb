require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def receive_broken_bikes(van)
		van.broken_bikes.each do |bike|
			@bikes << van.release(bike)
		end
	end

	def fix_bikes(bike)
		@bikes.each { |bike| bike.fix!}
	end




end