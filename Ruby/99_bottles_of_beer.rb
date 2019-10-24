require_relative "english_number"
puts 'How many bottles of beer on the wall?'
number = gets.chomp.to_i
bottle = ' bottles'
while number>=1
    puts englishNumber(number)+bottle+' of beer on the wall, '+englishNumber(number)+bottle+' of beer.'
    number -=1
    if number ==1
        bottle = ' bottle'
    end
    puts 'take one down and pass it around, '+englishNumber(number)+bottle+' of beer on the wall.'
    puts
end

puts 'No more bottles of beer on the wall, no more bottles of beer.'
puts 'Go to the store and buy some more, 99 bottles of beer on the wall.'
