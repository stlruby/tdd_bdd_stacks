class Node

  @value
  @next
  @prev

  def value
    @value
  end

  def value=(value)
    @value = value
  end

  def next_node
    @next
  end

  def next_node=(next_node)
    @next = next_node
  end

  def prev_node
    @prev
  end

  def prev_node=(prev_node)
    @prev = prev_node
  end

  def initialize(value, prev_node)
    @value = value
    @prev = prev_node
  end

end