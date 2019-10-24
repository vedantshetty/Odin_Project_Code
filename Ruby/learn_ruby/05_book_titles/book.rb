class Book
# write your code here
	@title
	def initialize
	@title =''
	end
	def title
		@title
	end
	
	def title=(title)
		little_words = ['and','the','or','in','of','a','an']
		title_words = title.split()
		title_words.each_with_index do |element,index|
			if ((not little_words.include?element) or index==0) 
				@title+= element.capitalize+' '
			else
				@title+=element+' '
			end
		end
		@title = @title[0..-2]
	end
end
