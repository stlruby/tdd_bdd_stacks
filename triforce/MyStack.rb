require 'rspec'

class Element
	attr_accessor :value, :previous

	def initialize(value, previous)
		@value = value
		@previous = previous
	end

	def size
		if @previous == nil
			return 1
		else
			return 1 + @previous.size
		end
	end
end


class MyStack
	def initialize
		@head = nil
	end

	def push(value)
	 	e = @head
		@head = Element.new(value, e)
	end

	def pop()
		if @head == nil
			return nil
		else
			result = @head.value
			@head = @head.previous
			return result
		end
	end

	def size()
		if @head == nil
			return 0
		else
			return @head.size
		end
	end

	def empty()
		@head = nil

	end
end

describe MyStack do
	it 'can be instantiated' do
		s = MyStack.new
		s.should be_a MyStack
	end
	
	describe :size do
		it 'should return zero for an empty stack' do
			s = MyStack.new
			s.size.should == 0
		end
	end

	describe :push do
		it 'should exist' do
			s = MyStack.new
			s.methods.should include :push
		end

		it 'push an element' do
			s = MyStack.new
			e = Element.new(1, nil)
			s.size.should == 0
			s.push(e)
			s.size.should == 1
		end	
	end

	describe :pop do
		it 'should exist' do
			s = MyStack.new
			s.methods.should include :pop
		end
		it 'should return nil if stack is empty' do
			s = MyStack.new
			s.pop.should == nil
		end
		it 'should return the first value for a one item stack' do
			s = MyStack.new
			s.push(44)
			s.pop.should == 44
			s.size.should == 0
		end

	end

	describe :empty do
		it 'should exist' do
			s = MyStack.new
			s.methods.should include :empty
		end
		it 'should actually empty the stack' do
			s = MyStack.new
			s.push(346)
			s.push(456254)
			s.push(23)
			s.push(42)
			s.size.should >= 3
			s.empty()
			s.size.should == 0
		end

	end
end

describe Element do
	it 'can be instantiated' do
		e = Element.new(1, nil)
		e.should be_a Element
	end	
	describe :new do
		it 'should accept nil element' do
			e = Element.new(1, nil)
			e.should be_a Element
		end
		it 'should accept element' do
			e = Element.new(1, nil)
			f = Element.new(2, e)
			f.should be_a Element
		end
	end
	describe :size do
		it 'should return 1 if no previous' do
			e = Element.new(2, nil)
			e.size.should == 1
		end
		it 'should return 2 if one previous' do
			e = Element.new(3, nil)
			f = Element.new(42, e)
			f.size.should == 2
		end

	end	
end
