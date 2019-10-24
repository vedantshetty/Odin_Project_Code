def echo input
	input
end

def shout input
	input.upcase
end

def repeat input,number=2
	output = input
	(number-1).times do
		output+=' '+input
	end
	output
end

def start_of_word word,index
	word[0..index-1]
end

def first_word input
	input.split()[0]
end

def titleize word
	word_set = word.split
	titlecase= ''
	little_words = ['and','the','or','over']
	word_set.each_with_index do |element,index|
		if (index==0 or(not little_words.include? element))
			titlecase+= ' '+element.capitalize
		else
			titlecase+= ' '+element
		end
	end
	titlecase[1..]
end
