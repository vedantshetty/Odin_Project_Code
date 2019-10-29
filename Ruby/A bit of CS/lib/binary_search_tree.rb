# create a binary seach tree that does not take duplicate values

class Node
  include Comparable
  attr_accessor :data, :left, :right
  def initialize(value)
    @left = nil
    @right = nil
    @data = value
  end

  def <=>(other)
    data <=> other.data
  end
end

class Tree
  attr_reader :root
  def initialize(arr)
    @root = build_tree(arr)
  end

  def preorder(node = @root)
    return [] unless node

    if block_given?
      yield(node.data)
      preorder(node.left) { |data| yield data }
      preorder(node.right) { |data| yield data }
    else
      [node.data] + preorder(node.left) + preorder(node.right)
    end
  end

  def inorder(node = @root)
    return [] unless node

    if block_given?
      inorder(node.left) { |data| yield data }
      yield(node.data)
      inorder(node.right) { |data| yield data }
    else
      inorder(node.left) + [node.data] + inorder(node.right)
    end
  end

  def postorder(node = @root)
    return [] unless node

    if block_given?
      postorder(node.left) { |data| yield data }
      postorder(node.right) { |data| yield data }
      yield(node.data)
    else
      postorder(node.left) + postorder(node.right) + [node.data]
    end
  end

  def build_tree(arr)
    root = Node.new(arr.shift)
    arr.each do |element|
      insert(element, root)
    end
    root
  end

  def delete(value)
    #TODO
  end

  def find(value, start = @root)
    return -1 unless start

    return start if value == start.data

    if value < start.data
      find(value, start.left)
    else
      find(value, start.right)
    end
  end

  def level_order()
    queue = [@root]
    output = []
    until queue.empty?
      current = queue.shift
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
      if block_given?
        yield(current.data)
      else
        output.push(current.data)
      end
    end
    output
  end

  def depth(node = @root)
    return 0 unless node

    left_depth = depth(node.left)
    right_depth = depth(node.right)
    left_depth > right_depth ? 1 + left_depth : 1 + right_depth
  end

  def insert(element, node = @root)
    if node.data == element
    elsif node.data > element
      node.left ? insert(element, node.left) : node.left = Node.new(element)
    else
      node.right ? insert(element, node.right) : node.right = Node.new(element)
    end
  end

  def balanced?(node = @root)
    return true unless node

    difference = depth(node.left) - depth(node.right)
    if [1, 0, -1].include? difference
      return balanced?(node.left) && balanced?(node.right)
    end

    false
  end

  def rebalance!
    elements_in_tree = inorder
    a=rebalanced_array(elements_in_tree)
    puts a.inspect
    @root = build_tree(a)
  end

  def rebalanced_array(elements_in_tree)
    balanced = []
    return [] if elements_in_tree.empty?

    index = elements_in_tree.length/2
    balanced.push(elements_in_tree[index])
    elements_in_tree.delete_at(index)
    return balanced if elements_in_tree.empty?
    balanced + rebalanced_array(elements_in_tree[0...index]) + rebalanced_array(elements_in_tree[index..])
  end
end

# Driver Script
my_tree = Tree.new(Array.new(15) { rand(1..100) })

my_tree = Tree.new(Array.new(15) { rand(1..100) }) until my_tree.balanced?


puts 'Printing'.center(50, '*')
print 'Level-Order: '
puts my_tree.level_order.inspect
print 'Preorder: '
puts my_tree.preorder.inspect
print 'Inorder: '
puts my_tree.inorder.inspect
print 'Postorder: '
puts my_tree.postorder.inspect

my_tree.insert(101)
my_tree.insert(119)
my_tree.insert(169)
puts my_tree.balanced? ? 'Tree is balanced' : 'Tree is not balanced'

my_tree.rebalance!

puts my_tree.balanced? ? 'Tree is now balanced' : 'Tree is still not balanced'


puts 'New Tree'.center(50, '*')
print 'Level-Order: '
puts my_tree.level_order.inspect
print 'Preorder: '
puts my_tree.preorder.inspect
print 'Inorder: '
puts my_tree.inorder.inspect
print 'Postorder: '
puts my_tree.postorder.inspect