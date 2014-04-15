require_relative '../app/stack'

describe Stack do
  describe 'when created' do
    subject { Stack.new }
    it { expect(subject).to be_instance_of(Stack) }
  end
end
