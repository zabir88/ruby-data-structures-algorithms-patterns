require 'byebug'
require_relative '../ruby-data-structure/doubly_linked_list_with_tail'

module StackQueueAlgorithm
  
  def self.isBalanced?(string)
    # Data Structure: Stack with Doubly Linked List
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    stack = DoublyLinkedListWithTail.new
    for i in 0..string.length-1
      stack.append(string[i]) if string[i] == '('
      stack.append(string[i]) if string[i] == '{'
      stack.append(string[i]) if string[i] == '['
      if string[i] == ')'
        if stack.tail.value == '('
          stack.pop
        else
          stack.append(string[i])
        end
      elsif string[i] == '}'
        if stack.tail.value == '{'
          stack.pop
        else
          stack.append(string[i])
        end
      elsif string[i] == ']'
        if stack.tail.value == '['
          stack.pop
        else
          stack.append(string[i])
        end
      end
    end
    stack.empty? ? true : false
  end
  ################################################################

  def self.lru_cache_add(val)
    # If capacity not reached keep prependinfg to the queue.
    # Once capacity is reached pop the last one and prepend the new one.
    queue = DoublyLinkedList.new
    capacity = 3
    if queue.length < capacity
      queue.prepend(val)
    else
      queue.pop
      queue.prepend(val)
    end
    queue
  end
  ################################################################

  def self.lru_cache_get(queue, val)
    # delete the node from queue
    # prepend node in queue
    
    # current_node = queue.head
    # while(current_node.value != val && current_node.next != nil)
    #   current_node = current_node.next
    # end    
    # prev_node = current_node.prev
    # next_node = current_node.next
    # prev_node.next = next_node
    # next_node.prev = prev_node
    # queue.prepend(current_node.value)
    
    getEl = queue.delete(val)
    queue.prepend(getEl.value)
    queue.head
  end
  ################################################################

  def self.min_in_stack(s1)
    min = s1.pop
    while(s1.length > 0 )
      last = s1.pop
      if(last < min)
        min = last
      end
    end
    min
  end
  ################################################################

  def self.sort_stack(s1)
    s2 = []
    while(s1.length != 0)
      tmp = s1.pop
      while(s2.empty? == false && s2.last > tmp)
        s1.push(s2.pop)
      end
      s2.push(tmp)
    end
    s2
  end
  ################################################################

  def self.dequeue_with_two_stacks(s1)
    # Enqueue will be the same as push method in stack    
    # For Dequeue the stack has to be reversed and then perform pop on reversed stack
    s1 = s1
    s2 = []
    while(s1.length > 0)
      last = s1.pop
      s2.push(last)
    end
    s2.pop
    while(s2.length > 0)
      s1.push(s2.pop)
    end
    s1
  end
  ################################################################
end

queue = DoublyLinkedListWithTail.new
queue.append(1)
queue.append(2)
queue.append(3)
# p StackQueueAlgorithm.isBalanced?('{[()]}')
p StackQueueAlgorithm.dequeue_with_two_stacks([1,2,3])




