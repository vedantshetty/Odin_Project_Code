class LinkedList

  def append(value)
    new_node = Node.new(value)
    unless @head
      @head = new_node
      return
    end
    node = @head
    while node.next
      node = node.next
    end
    node.next = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  def size
    node = @head
    size = 0
    while node
      node = node.next
      size += 1
    end
    size
  end

  def head
    @head
  end

  def tail
    node = @head
    while node.next
      node = node.next
    end
    node
  end

  def at(index)
    node = @head
    while index>0
      node = node.next
      index -= 1
    end
    node
  end

  def pop
    node = @head
    if @head.next == nil
      @head = nil
      return node.value
    end

    while node.next
      prev = node
      node = node.next
    end
    prev.next = nil
    node.value
  end

  def contains?(value)
    node = @head
    while node
      return true if node.value == value
      node = node.next
    end
    false
  end

  def find(value)
    node = @head
    index = 0
    while node
      return index if node.value == value

      index += 1
      node = node.next
    end
  end


  def to_s
    node = @head
    output = ''
    while node
      output += "(#{node.value})->"
      node = node.next
    end
    output + 'nil'
  end
end

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end


l = LinkedList.new
l.prepend(3)
l.prepend(4)
l.prepend(5)
