=begin
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

def prime?(number)
    2.upto(number/2) do |factor|
       return factor if number%factor == 0
    end
    -1
end

number = 600851475143
while (factor = prime? number)!= -1 do
        number/=factor
end
puts number
