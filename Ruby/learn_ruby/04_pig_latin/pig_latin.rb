def translate words
	words = words.split
	vowels = ['a','e','i','o','u']
	pig_latin = ''
	words.each do |word|
		index = 0
		until (vowels.include?word[index] and (word[index-1]+word[index] !='qu'))
			index+=1
		end
		if index !=0
	 		pig_latin+= ' '+word[index..]+word[0..index-1]+'ay'
	 	else
	 		pig_latin+= ' '+word[index..]+'ay'
	 	end
	 end
	 pig_latin[1..]
end


