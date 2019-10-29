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


