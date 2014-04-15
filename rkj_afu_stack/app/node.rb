class Node 
  attr_reader :content, :previous

  def initialize(content,previous)
    @content = content
    @previous = previous
  end
end
