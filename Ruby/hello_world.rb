def flatten(n)
    result = []
    n.each do |element|
        unless element.kind_of?Array
            result.push(element)
        else
            inner = flatten(element)
            inner.each do |index|
                result.push(index)
            end
        end
    end
    result
end

puts flatten([[1,2],[3,4]]).inspect
puts flatten([[1, [8, 9]], [3, 4]] ).inspect