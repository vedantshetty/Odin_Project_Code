def substrings(text,dictionary)
    text.downcase!
    counts =Hash.new(0)
    text.split(' ').each do |word|
        dictionary.each do |checker|
            temp_word = word.dup
            while temp_word.include?checker
                counts[checker]+=1   
                temp_word.sub!(checker,'')
            end
        end
    end
    counts
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)