require_relative 'stack'

describe Stack do
  context 'Anytime' do
    it { should respond_to(:empty?) }
    it { should respond_to(:peek) }
    it { should respond_to(:pop) }
    it { should respond_to(:size) }
    it { should respond_to(:push) }
  end

  context 'When it has no entries' do
    before :each do
      @stack = Stack.new
    end

    it 'it is empty' do
      expect(@stack.empty?).to eq(true)
    end

    it 'it has no size' do
      expect(@stack.size).to eq(0)
    end

  end

  context 'When it has entries' do
    before :each do
      @value = [1, 'a', 2, 'b', 3, 'c']
      @stack = Stack.new
      @value.each do |value|
        @stack.push value
      end
    end

    it 'is not empty' do
      expect(@stack.empty?).to eq(false)
    end
    it 'plays peekaboo' do
      expect(@stack.peek).to eq(@value[@value.size-1])
    end
    it 'likes popcorn' do
      size = @stack.size
      expect(@stack.pop).to eq(@value[@value.size-1])
      expect(@stack.size).to eq(size-1)
    end
    it 'has a size' do
      expect(@stack.size).to eq(@value.size)
    end
  end

end