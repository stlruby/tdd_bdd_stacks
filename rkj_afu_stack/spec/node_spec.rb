require_relative '../app/node'

describe Node do
  subject {Node.new('test', nil)}

  describe 'when_created' do
    subject {Node.new('test', nil)}
    it { expect(subject).to be_instance_of(Node) }
    it { expect(subject.content).to eq('test') }
    it { expect(subject.previous).to eq(nil) }
  end
 
  it { expect(subject).to respond_to(:content) }
end
