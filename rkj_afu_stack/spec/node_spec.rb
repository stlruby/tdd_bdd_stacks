require_relative '../app/node'

describe Node do
  describe 'when_created' do
    subject {Node.new}
    it { expect(subject).to be_instance_of(Node) }
    it { expect(subject.content).to be_nil }
  end

  it { expect(subject).to respond_to(:content) }
end
