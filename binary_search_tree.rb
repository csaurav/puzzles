#binary search tree
#
#
class Tree
  attr_accessor :left, :value, :right

  def initialize(value, left, right)
    @left = left
    @right = right
    @value = value
  end
end

class BinarySearchTree

  def initialize(val)
    @root = Tree.new(val, nil, nil)
  end


  def pre_order_traversal(node = @root)
    return if (node == nil)
    pre_order_traversal(node.left)
    pre_order_traversal(node.right)
    puts node.value.to_s
  end

  def post_order_traversal(node = @root)
    return if (node == nil)
    puts node.value.to_s
    post_order_traversal(node.left)
    post_order_traversal(node.right)
  end

  def in_order_traversal(node = @root)
    return if (node == nil)
    in_order_traversal(node.left)
    puts node.value.to_s
    in_order_traversal(node.right)
  end


  def insert(value)
    puts "Inserting: #{value}"

    current_node = @root

    while nil != current_node
      if (value < current_node.value) && (current_node.left == nil)
        current_node.left = Tree.new(value,nil,nil)
      elsif  (value > current_node.value) && (current_node.right == nil)
        current_node.right = Tree.new(value,nil,nil)
      elsif (value < current_node.value)
        current_node = current_node.left
      elsif (value > current_node.value)
        current_node = current_node.right
      else
        return
      end
    end
  end
end

bst = BinarySearchTree.new(10)
bst.insert(11)
bst.insert(9)
bst.insert(5)
bst.insert(7)
bst.insert(18)
bst.insert(17)

puts "BinarySearchTree: #{bst.inspect}"

puts "In-Order Traversal:"
bst.in_order_traversal
puts "Pre-Order Traversal:"
bst.pre_order_traversal
puts "Post-Order Traversal:"
bst.post_order_traversal
