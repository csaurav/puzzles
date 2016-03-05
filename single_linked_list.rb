# write a function to detect a cycle in a singly linked list
#
class SinglyLinkedList
  attr_accessor :node_value, :next_node
  def initialize(value, node = nil)
    @node_value = value
    @next_node = node
  end


  def self.detect_cycle(start)
    fast_ref = start
    slow_ref = start
    puts "start: #{start.node_value}"  

    while fast_ref do
      fast_ref = fast_ref.next_node
    #  puts "1. fast_ref: #{fast_ref.node_value}"
      return false unless fast_ref

      fast_ref = fast_ref.next_node
     # puts "2. fast_ref: #{fast_ref.node_value}"
      slow_ref = slow_ref.next_node
     # puts "1. slow_ref: #{slow_ref.node_value}"
      return true if slow_ref == fast_ref
    end
    
    return false
  end


  def self.cycle_length(start)
    count = 0
    increment_count = false

    fast_ref = slow_ref = start

    while fast_ref do
      fast_ref = fast_ref.next_node
      return false unless fast_ref

      fast_ref = fast_ref.next_node

      slow_ref = slow_ref.next_node

      if fast_ref == slow_ref
        if count == 0
          increment_count = true
        else
          return count
        end
        count += 1 if increment_count
      end
    end
    return false
  end

end

list_1 = SinglyLinkedList.new(10)
list_2 = SinglyLinkedList.new(20, list_1)
list_3 = SinglyLinkedList.new(30, list_2)
list_4 = SinglyLinkedList.new(40, list_3)
list_5 = SinglyLinkedList.new(50, list_4)
list_1.next_node = list_4
#puts list_4.inspect

#puts list_1.inspect


puts SinglyLinkedList.detect_cycle(list_4)
puts "Length of a cycle: #{SinglyLinkedList.cycle_length(list_4)}"
