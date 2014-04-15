require_relative '../app/stack'

describe Stack do
  describe 'a newly created object' do
    subject { Stack.new }
    it { expect(subject).to be_instance_of(Stack) }
    context '.empty?' do
      it { expect(subject.empty?).to be_true }
    end
  end

  describe '.empty?' do
    subject { Stack.new }
    it { expect(subject.empty?).to be_true }
  end
  
  describe '.size' do
    context 'with an empty stack' do
      before do 
        @stack = Stack.new
      end
      it { expect(@stack.size).to eq(0) }
    end
    context 'with one item' do
      before do 
        @stack = Stack.new
        @stack.push('one')
      end
      it { expect(@stack.size).to eq(1) }
    end
    context 'with multiple items' do
      before do 
        @stack = Stack.new
        @stack.push('one')
        @stack.push(2)
        @stack.push([3])
      end
      it { expect(@stack.size).to eq(3) }
    end
  end

  describe '.push' do
     before do
       @stack = Stack.new
       an_object = Object.new
       @stack.push an_object
     end
     it { expect(@stack.size).to eq(1) }
  end
end
