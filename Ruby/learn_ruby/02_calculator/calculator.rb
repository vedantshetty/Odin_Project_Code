def add(a,b)
	a+b
end


def subtract(a,b)
	a-b
end


def sum(a)
	s = 0
	a.each do |element|
		s+=element
	end
	s
end

def multiply(*number)
	product = 1
	number.each do |element|
		product *= element
	end
	product
	
end

def power(a,b)
	a**b
end


def factorial(a)
	if a <=1
		return 1
	else
		a* factorial(a-1)
	end
end
