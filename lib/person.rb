class Person

	def initialize
		@bike = []
	end

	def bike_count
		@bike.count
	end

	def not_have_a_bike(bike)
		bike_count == 0
	end

	def to_have_a_bike(bike)
		bike_count == 1
	end

	def rent_available_bike(station)
		station.bikes.each { |bike| (station.release(bike)) unless bike.broken?}
	end

	def has_accident(bike)
		bike.break!
	end
end

