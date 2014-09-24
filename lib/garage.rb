require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end


end