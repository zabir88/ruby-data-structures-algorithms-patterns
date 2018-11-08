require_relative '../ruby-data-structure/singly_linked_list'
require_relative '../ruby-data-structure/doubly_linked_list'
require 'byebug'

module LinkedListAlgorithm
  # Condition: Each node can hold single digit as a value.
  # Data Structure: Singly Linked List
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def self.add_two_numbers_as_linked_list(l1 = SinglyLinkedList.new,l2 = SinglyLinkedList.new)
    l1.append(2)
    l1.append(6)
    l1.append(1)
    l2.append(7)
    l2.append(2)
    l2.append(1)
    result_list = SinglyLinkedList.new
    length = l1.length > l2.length ? l1.length : l2.length 
    carry = 0
    
    while(length > 0)
      a = l1.shift 
      b = l2.shift 
      sum = a + b + carry
      if(sum > 9)
        sum = 0 
        carry = 1
      else
        carry = 0
      end
      result_list.unshift(sum)
      length -= 1    
    end
    result_list.head
  end
  ################################################################

  def self.remove_duplicates_in_linked_list(list)

  end
  ################################################################

  def self.delete_middle_node(list)

  end
  ################################################################

  def self.palindrome(list)

  end
  ################################################################

  def self.loop_detection()

  end
  ################################################################
end

p LinkedListAlgorithm.add_two_numbers_as_linked_list

