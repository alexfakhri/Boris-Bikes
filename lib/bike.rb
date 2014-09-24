class Bike

	# the intialize method is always called when you create a new
	# class by typing Bike.new
	def initialze
		# all instance variables begin with "@"
		# this must be an instance variable because we'll need it
		# in other methods
		fix!
	end

	def broken?
		# intsance variables are accessible in all methods
		@broken
	end

	def break!
		# and any instance method can update them
		@broken = true
	end

	def fix!
		@broken = false

	end

end