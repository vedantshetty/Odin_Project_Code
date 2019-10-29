# create a binary seach tree that does not take duplicate values

class Node
  include 'Comparable'
  attr_accessor :data,:left,:right
  def initialize(value)
    @left = nil
    @right = nil
    @data = value
  end

  def <=>(other)
    self.data <=> other.data
  end

end


class Tree

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    root = Node.new(arr.shift)
    arr.each do |element|
      insert_child(root, element)
    end
  end

  def insert_child(node, element)
    if node.data == element
      return
    elsif node.data < element
      return  3
    else
      return node.right?insert_child(node.right, element) : node.right = Node.new(element)
    end
  end
end


