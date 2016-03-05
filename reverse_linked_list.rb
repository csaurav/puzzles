# Reverse a linked list without using an array
#
# Instructions for running the program from console: ruby reverse_linked_list.rb

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    
    @value = value
    @next_node = next_node
  end

  # This method with print the linked list
  def self.traverse(current_node)
    print "#{current_node.value} ------>"

    if current_node.next_node.nil?
      print "nil\n"
      return
    else
      traverse(current_node.next_node)
    end
  end

  # Method for reversing the linked list
  #
  def self.reverse_list(list)
    stack = Stack.new
    while list
      stack.push list.value
      list = list.next_node
    end

    new_stack = Stack.new
    while stack.data
      new_stack.push(stack.pop)
    end

    stack = new_stack

    reverse_list = nil

    while stack.data
      reversed_list = LinkedListNode.new(stack.pop, reversed_list)
    end
    return reversed_list
  end
end


class Stack
  attr_accessor :data

  def initialize
    @data = nil
  end

  # Implement push functionality of a stack
  def push(value) 
    @data = LinkedListNode.new(value, @data)
  end

  #Implement pop functionality of a stack
  def pop
    popped = @data.value
    @data = @data.next_node
    return popped
  end
end

node_1 = LinkedListNode.new(10)
node_2 = LinkedListNode.new(20,node_1)
node_3 = LinkedListNode.new(30, node_2)
node_4 = LinkedListNode.new(40, node_3)
node_5 = LinkedListNode.new(50, node_4)


LinkedListNode.traverse(node_5)
reversed_list = LinkedListNode.reverse_list(node_5)
puts "Reversed Linked List:"
LinkedListNode.traverse(reversed_list)
