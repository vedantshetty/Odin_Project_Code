def caesar_cipher(code, shift)
    encrypted=''
    code.each_char do |element|
        upper = 65 if element =~/[A-Z]/
        upper = 97 if element=~/[a-z]/
        if upper ==65 or upper ==97
            encrypted+=((element.ord-upper+shift)%26+ upper).chr
        else 
            encrypted+=element
        end
    end
    encrypted
end


puts caesar_cipher('What a string!',5)