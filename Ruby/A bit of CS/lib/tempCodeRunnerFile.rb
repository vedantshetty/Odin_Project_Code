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