class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @tail = Node.new
    @head = Node.new(nil, @tail)
  end

  def append(value, node = @head)
    if node.next_node == @tail
      new_node = Node.new(value, @tail)
      node.next_node = new_node
    else
      append(value, node.next_node)
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head.next_node)
    @head.next_node = new_node
  end

  def size(curr_size = 0, node = @head)
    return curr_size if node.next_node == @tail

    size(curr_size + 1, node.next_node)
  end

  def head
    @head.next_node
  end

  def tail(node = @head)
    return node if node.next_node == @tail

    tail(node.next_node)
  end

  def at(index, current = 0, node = @head)
    return node if index == current

    at(index, current + 1, node.next_node)
  end

  def pop(node = @head)
    curr_node = node.next_node
    if curr_node.next_node == @tail
      node.next_node = @tail
    else
      pop(node.next_node)
    end
  end

  def contains?(value, node = @head)
    if node.value == value
      true
    elsif node.next_node
      contains?(value, node.next_node)
    else
      false
    end
  end

  def find(value, index = 0, node = @head)
    if node.value == value
      index
    elsif node.next_node
      find(value, index + 1, node.next_node)
    end
  end

  def to_s(string = '', node = @head.next_node)
    if node.next_node
      to_s(string + "( #{node.value} ) - > ", node.next_node)
    else
      "#{string}nil"
    end
  end

  def insert_at(value, index)
    prev_node = at(index - 1)
    curr_node = prev_node.next_node
    new_node = Node.new(value, curr_node)
    prev_node.next_node = new_node
  end

  def remove_at(index)
    prev_node = at(index - 1)
    curr_node = prev_node.next_node
    prev_node.next_node = curr_node.next_node
  end
end
