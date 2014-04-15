require_relative 'node'

class Stack

  @current_node


  def empty?
    @current_node.nil?
  end

  def push(value)
    if empty?
      @current_node = Node.new value, nil
    else
      @current_node = Node.new value, @current_node
    end
  end

  def pop
    return_value = @current_node
    @current_node = @current_node.prev_node
    return_value.value
  end

  def size
    return 0 if empty?
    size = 1
    node = @current_node

    while (!node.prev_node.nil?) do
      node = node.prev_node
      size += 1
    end

    size
  end

  def peek
    @current_node.value
  end

end