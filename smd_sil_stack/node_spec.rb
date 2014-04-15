require_relative 'node'

describe Node do
  it { should respond_to(:value) }
  it { should respond_to(:prev_node) }
  it { should respond_to(:next_node) }



end