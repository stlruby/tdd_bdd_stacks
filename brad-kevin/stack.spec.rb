require_relative 'stack'

describe 'Implements a stack in Ruby' do

    before(:each) do
        @stack = Stack.new
    end

    describe 'Implements push and count correctly' do

        it 'Conts 1 after 1 item is pushed' do
            @stack.push 'foo'
            @stack.count.should == 1
        end
        it 'counts 2 after 2 items are pushed' do
            @stack.push 'foo'
            @stack.push 'bar'
            @stack.count.should == 2
        end
        it 'counts 2 after 2 IDENTICAL items are pushed' do
            @stack.push 'foo'
            @stack.push 'foo'
            @stack.count.should == 2
        end
        it 'counts 100 after 100 items are pushed' do
            100.times { @stack.push 'foo' }
            @stack.count.should == 100
        end
        it 'counts 0 after no items are pushed' do
            @stack.count.should == 0
        end
        it 'counts 1 after empty string pushed' do
            @stack.push ''
            @stack.count.should == 1
        end
        it 'counts 1 after nil is pushed' do
            @stack.push nil
            @stack.count.should == 1
        end
        it 'counts 1 after an object is pushed' do
            @stack.push Object.new
            @stack.count.should == 1
        end
        it 'counts 1 after a number is pushed' do
            @stack.push 1
            @stack.count.should == 1
        end
    end

    describe 'implements pop correctly' do

        it 'returns the same object after object is pushed then popped' do
            obj = 'foo'
            @stack.push obj
            @stack.pop.should == obj
            @stack.count.should == 0
        end

        it 'raises error if pop is called when stack is empty' do
            lambda { @stack.pop }.should raise_error
        end

        it 'Returns object in LIFO order when 2 are push' do
            obj1 = 'foo'
            obj2 = 'bar'
            @stack.push obj1
            @stack.push obj2
            @stack.pop.should == obj2
            @stack.pop.should == obj1
            @stack.count.should == 0
        end

        it 'Returns object in LIFO order when objs are pushed and popped' do
            obj1 = 'foo'
            obj2 = 'bar'
            obj3 = 'baz'
            @stack.push obj1
            @stack.push obj2
            @stack.pop.should == obj2
            @stack.push obj3
            @stack.pop.should == obj3
            @stack.pop.should == obj1
        end

        it 'Raises errors when more objects are popped than exist' do
            obj1 = 'foo'
            obj2 = 'bar'
            @stack.push obj1
            @stack.push obj2
            @stack.pop.should == obj2
            @stack.pop.should == obj1
            lambda { @stack.pop }.should raise_error
        end

    end

    describe 'Implements peak correctly' do

        it 'Returns object after push' do
            obj1 = 'cool'
            @stack.push obj1
            @stack.peak.should == obj1
            @stack.count.should == 1
        end

        it 'Returns object after push two objects' do
            obj1 = 'cool'
            obj2 = 'beans'
            @stack.push obj1
            @stack.push obj2
            @stack.peak.should == obj2
            @stack.count.should == 2
        end

        it 'Raises error if stack empty' do
            lambda { @stack.peak }.should raise_error
        end

        it 'Raises error if stack empty after push and pop' do
            obj = 'stuff'
            @stack.push obj
            @stack.pop
            lambda { @stack.peak }.should raise_error
        end


        it 'Returns the same object if called multiple times' do
            obj1 = 'foo'
            obj2 = 'bar'
            obj3 = 'baz'
            @stack.push obj1
            @stack.push obj2
            @stack.push obj3
            @stack.peak.should == obj3
            @stack.peak.should == obj3
            @stack.peak.should == obj3
        end

    end

    describe 'Empties the stack on empty' do
        it 'Returns true on no items' do
            @stack.empty?.should == true
        end
        it 'Returns false with items' do
            @stack.push "foo"
            @stack.empty?.should == false
        end
        it 'Returns false with items' do
            @stack.push "foo"
            @stack.push "bar"
            @stack.empty?.should == false
        end
        it 'Returns true after push and false' do
            @stack.push "foo"
            @stack.pop
            @stack.empty?.should == true
        end
    end

end