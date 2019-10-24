puts 'enter the starting year'
start = gets.chomp.to_i
puts 'enter the end year'
last = gets.chomp.to_i
puts 'The leap years between '+start.to_s+' and '+last.to_s+' are'

while (start<last)
    if (start%400 == 0)
        puts start
    elsif (start%4==0 and start%100 !=0)
        puts start
    end
    start+=1
end