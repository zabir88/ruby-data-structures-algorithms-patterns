require '../data-structure/singly_linked_list'
# require '../ruby-data-structure/doubly_linked_list'
require 'byebug'

module LinkedListAlgorithm
  # Condition: Each node can hold single digit as a value.
  # Data Structure: Singly Linked List
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def self.add_two_numbers_as_linked_list(l1, l2)
    result_list = SinglyLinkedList.new
    length = l1.length > l2.length ? l1.length : l2.length 
    carry = 0
    
    while(length > 0)
      a = l1.pop 
      b = l2.pop 
      sum = a.value + b.value + carry
      if(sum > 9)
        sum = 0 
        carry = 1
      else
        carry = 0
      end
      result_list.append(sum)
      length -= 1    
    end
    result_list.reverse
  end
  ################################################################

  def self.remove_duplicates_in_linked_list(list)
    current = list.head
    count_dups = Hash.new(0)
    while(current.next != nil)
      count_dups[current.value] += 1  
      current = current.next
    end
    count_dups.keys
  end
  ################################################################

  def self.delete_middle_node(list, element)
    # Assuming singly linked list
    current_node = list.head
    last_node = list.tail
    if(current_node.value == element)
      current_node.next = current_node
    elsif(last_node.value == element)
      while(current_node.next != nil)
        prev_node = current_node
        current_node = current_node.next
      end
      prev_node.next = nil
      last_node = prev_node
    else 
      while(current_node.next != nil)
        prev_node = current_node 
        current_node = current_node.next
      end
      prev_node.next = current_node.next
    end
  end
  ################################################################

  def self.palindrome(list)
    current_list_node = list.head
    # reverse_list_node = list.reverse
    p current_list_node
    p list.reverse
    upto = list.length/2
    i = 0
    while(i <= upto) 
      # p i
      # p current_list_node
      # p reverse_list_node
      if(current_list_node.value != reverse_list_node.value)
        return false
      end
      current_list_node = current_list_node.next
      reverse_list_node = reverse_list_node.next
      i += 1
    end
    return true
  end
  ################################################################

  def self.remove_nth_from_end(list, n)
    # Data Structure: Singly Linked List
    # Time complexity: O(n)
    # Space complexity: O(1)
    list.reverse # O(n)
    current_node = list.head
    i = 1
    while(i != n)
      prev_node = current_node
      current_node = current_node.next
      i += 1
    end
    prev_node.next = current_node.next
    list.reverse # O(n)
  end
  ################################################################
  def self.loop_detection()

  end
  ################################################################
end

l1 = SinglyLinkedList.new
l2 = SinglyLinkedList.new
l1.append(2)
l1.append(4)
l1.append(3)
l2.append(5)
l2.append(6)
l2.append(4)

p LinkedListAlgorithm.add_two_numbers_as_linked_list(l1, l2)


