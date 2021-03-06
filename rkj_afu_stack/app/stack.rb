require_relative './node'

class Stack
  def initialize
    @head = nil
  end
 
  def empty?
    return true unless @head
    size == 0
  end
  
  def size
    count = 0
    item = @head
    if item
      begin
        count += 1
        item = item.previous 
      end while(item)    
    end
    count
  end

  def push(node_content)
    @head = Node.new(node_content, @head) 
  end

  def pop
    return nil if empty?
    current = @head
    @head = @head.previous
    current.content
  end

  def peek
    return nil if empty?
    @head.content
  end
end
