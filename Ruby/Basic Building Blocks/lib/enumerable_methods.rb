module Enumerable
    def my_each
        counter = 0
        while counter<self.size
             yield(self[counter])if block_given?
            counter+=1
        end
    end

    def my_each_with_index
        counter = 0 
        while counter <self.size
            yield(self[counter],counter) if block_given?
            counter+=1
        end
    end

    def my_select
        result = []
        counter = 0
        return self unless block_given?
        while counter<self.size
            result.push(self[counter]) if yield(self[counter])
            counter +=1
        end
        result
    end

    def my_all? value=0
        counter = 0
        while counter<self.length
            if block_given?
                return false unless yield(self[counter])
            else
                return false if self[counter] != value
            end
            counter+=1
        end
        true
    end

    def my_any? value =0
        counter = 0
        result = false
        while counter<self.length
            if block_given?
                return true if yield(self[counter])
            else
                return true if self[counter] == value
            end
            counter+=1
        end
        false
    end

    def my_none? value =0
        counter = 0
        while counter<self.length
            if block_given?
                return false if yield(self[counter])
            else
                return false if self[counter] == value
            end
            counter+=1
        end
        true
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


