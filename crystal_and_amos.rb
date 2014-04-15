class Lifo
  EmptyError = Class.new(Exception)

  class Node < Struct.new(:value, :next)
    def to_ary
      [value, self.next]
    end
  end

  attr_accessor :size, :top

  def initialize
    self.size, self.top = 0, nil
  end

  def empty?
    size.zero?
  end

  def push(element)
    self.size += 1
    self.top = Node.new(element, top)
  end

  def pop
    raise EmptyError if empty?
    self.size -= 1
    temp_value, self.top = top
    temp_value
  end

  def peek
    raise EmptyError if empty?
    top.value
  end
end

describe Lifo do
  describe "that is new" do
    it { is_expected.to be_empty }
    specify { expect(subject.size).to be_zero }

    specify do
      expect { subject.push :element }.to change{ subject.size }.by(1)
    end

    specify do
      subject.push :element
      expect(subject).to_not be_empty
    end

    specify do
      expect{ subject.pop }.to raise_error(Lifo::EmptyError)
    end

    specify do
      expect{ subject.peek }.to raise_error(Lifo::EmptyError)
    end
  end

  describe "that has one element" do
    before do
      subject.push :element
    end

    specify do
      expect{ subject.pop }.to change{ subject.size }.by(-1)
    end

    specify do
      expect(subject.pop).to eql(:element)
    end

    specify do
      expect(subject.peek).to eql(:element)
    end
  end

  describe "that has two elements" do
    before do
      subject.push :first_element
      subject.push :second_element
    end

    specify do
      expect(subject.pop).to eql(:second_element)
    end

    specify do
      subject.pop
      expect(subject.pop).to eql(:first_element)
    end
  end
end


__END__
push = add something to the stack
pop = take something off the stack
empty? = tells us if is empty
size = tells us how many items are in the stack
