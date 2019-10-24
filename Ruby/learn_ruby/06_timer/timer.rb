class Timer
	def initialize
		@timer = 0
	end
	def seconds=(timer)
		@timer = timer
	end
	def seconds
		@timer
	end
	def time_string
		hours = @timer/60/60
		mins = (@timer - hours*60*60)/60
		seconds = @timer - mins*60 - hours*60*60
		
		hours_formatted = hours.to_s
		mins_formatted = mins.to_s
		seconds_formatted = seconds.to_s
		
		hours_formatted = '0'+hours_formatted if hours_formatted.length<2
		mins_formatted = '0'+mins_formatted if mins_formatted.length<2
		seconds_formatted ='0'+seconds_formatted if seconds_formatted.length<2
		
		return "#{hours_formatted}:#{mins_formatted}:#{seconds_formatted}"
	end
end
