require 'rspec'

class Stack
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def empty?
    @size == 0
  end

  def push value
    @size = @size + 1
    prev_head = @head
    @head = ->do
      [value, prev_head]
    end
    @head.call.first
  end

  def pop
    return if @head.nil?
    @size = @size - 1
    value, @head = @head.call
    value
  end

  def peek
    return if @head.nil?
    @head.call.first
  end
end

describe Stack do
  describe "an empty stack" do
    before :each do
      @s = Stack.new
    end
    it "size is 0" do
      @s.size.should == 0
    end

    it "empty? returns true" do
      @s.empty?.should be_true
    end

    it "push increments size by 1" do
      @s.push 4
      @s.size.should == 1
    end

    it "pop returns nil" do
      @s.pop.should be_nil
    end

    it "peek returns nil" do
      @s.peek.should be_nil
    end
  end

  describe "a 1 item stack" do
    before :each do
      @s = Stack.new
      @s.push 4
    end

    it "size is 1" do
      @s.size.should == 1
    end

    it "empty? returns false" do
      @s.empty?.should be_false
    end

    it "pop returns the item" do
      @s.pop.should == 4
    end

    it "peek returns the item without removing" do
      @s.peek.should == 4
      @s.peek.should == 4
    end

    it "second pop returns nil" do
      @s.pop
      @s.pop.should be_nil
    end
  end

  describe "a 2 item stack" do
    before :each do
      @s = Stack.new
      @s.push 4
      @s.push 5
    end

    it "pop in sequence works" do
      @s.pop.should == 5
      @s.pop.should == 4
    end

    it "peek returns correct item" do
      @s.peek.should == 5
    end
  end
end
