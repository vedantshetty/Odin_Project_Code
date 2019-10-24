module Enumerable
    def my_each
        counter = 0
        while counter<self.size
            yield(self[counter])
            counter+=1
        end
    end

    def my_each_with_index
        counter = 0 
        while counter <self.size
            yield(self[counter],counter)
            counter+=1
        end
    end

    def my_select
        result = []
        counter = 0
        while counter<self.size
            result.push(self[counter]) if yield(self[counter])
            counter +=1
        end
        result
    end

    def my_all?
        result = true
        counter = 0
        while counter<self.length
            result = false unless yield(self[counter])
            counter+=1
        end
        result
    end

    def my_any?
        counter = 0
        result = false
        while counter<self.length
            result = true if yield(self[counter])
            counter+=1
        end
        result
    end

    def my_none?
        counter = 0
        result = true
        while counter<self.length
            result = false if yield(self[counter])
            counter+=1
        end
        result
    end

    def my_count
        counter = 0
        result = 0
        while counter<self.length
            if block_given?
                result+=1 if yield(self[counter])
            else
                return self.length
            end
            counter+=1
        end
        result
    end

    def my_map(procedure=nil)
        result =[]
        counter = 0
        while counter <self.length
            if procedure == nil 
                result.push(yield(self[counter]))
            else
                result.push(procedure.call(self[counter]))
            end
            counter+=1
        end
        result
    end

    def my_inject(default=self[0])
        result =default
        counter =1
        while counter<self.length
            result = yield(result,self[counter])
            counter+=1
        end
        result
    end
end

def multiply_els array
    array.my_inject do
        |product,element|
        product*element
    end
end


a = [1,2,3,4,5]
b = ['hey','hi','how','are','you']

puts 'EACH'.center(20,"-")
#my_each
b.my_each do |element|
    puts element
end

puts 'EACH_WITH_INDEX'.center(20,"-")
#my_each_with_index
b.my_each_with_index do |element,index|
    puts "#{index}.#{element}"
end

puts 'SELECT'.center(20,"-")
#my_select
puts a.my_select { |element| element%2==0}.to_s

puts 'ALL?'.center(20,"-")
#my_all?
puts a.my_all?{|element| element<10}
puts a.my_all?{|element| element%2==0}

puts 'ANY?'.center(20,"-")
#my_any
puts a.my_any?{|element| element>=5}
puts a.my_any?{|element| element%2==0}
puts a.my_any?{|element| element>5}

puts 'NONE?'.center(20,"-")
#my_none
puts a.my_none? {|element| element>5}
puts a.my_none?{|element|element>=5}

puts 'COUNT?'.center(20,"-")
#my_count
puts a.my_count
puts a.my_count{ |element| element%2==0}

puts 'MAP'.center(20,"-")
#my_map
puts a.my_map {|element| element**2}.to_s

#my_inject
puts 'INJECT'.center(20,"-")
puts a.my_inject {|sum,element| sum+element}



#Tests
puts ''.center(50,"*")
puts multiply_els([2,4,5])

#my_map with proc
procedure = Proc.new { |element| element**3}
puts a.my_map(procedure).to_s