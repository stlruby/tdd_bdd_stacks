class Stack

    def initialize
        @counter = 0
    end

    def push(item)
        @counter = @counter + 1
        instance_variable_set('@slot_' + @counter.to_s, item)
    end

    def pop
        raise Error.new('Stack is Empty!') if @counter ==  0
        item = instance_variable_get('@slot_' + @counter.to_s)
        remove_instance_variable('@slot_' + @counter.to_s)
        @counter = @counter - 1
        item
    end

    def peak
        raise Error.new('Stack is Empty!') if(@counter == 0)
        instance_variable_get('@slot_' + @counter.to_s)
    end

    def empty?
        @counter == 0
    end

    def count
        @counter
    end

end