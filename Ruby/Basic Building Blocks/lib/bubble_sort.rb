def bubble_sort(array)
    0.upto(array.length - 2) do |outer_index|
        swap = false
        0.upto(array.length-2- outer_index) do |inner_index|
            if array[inner_index]>array[inner_index+1]
                array[inner_index], array[inner_index+1] = array[inner_index+1],array[inner_index]
                swap = true
            end
        end
        break if swap == false
    end
    array
end

def bubble_sort_by(array)
    swap = true
    iteration = 0
    while swap == true do
        swap = false
        0.upto(array.length-2-iteration) do |index|
            if yield(array[index],array[index+1]) > 0
                array[index],array[index+1] = array[index+1],array[index]
                swap = true
            end
        end
        iteration+=1
    end
    array
end

=begin
puts bubble_sort([4,3,78,2,0,2]).to_s


puts bubble_sort_by(['hi','hello','hey']) { |left,right|
    left.length- right.length
}

=end