count = 0
while count !=3
    input = gets.chomp
    if input =='BYE'
    count+=1
    elsif input == input.upcase
        puts 'No, Not since '.upcase+ (rand(20)+1930).to_s+'!'
        count = 0
    else
        puts 'Huh?! Speak up, sonny!'.upcase
        count =0
    end
end

puts ' OKAY BYE SONNY'