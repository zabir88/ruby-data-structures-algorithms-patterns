require 'byebug'
require_relative '../ruby-data-structure/doubly_linked_list'

module StackQueueAlgorithm
  
  def self.isBalanced?(string)
    # Data Structure: Stack with Doubly Linked List
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    stack = DoublyLinkedList.new

    string = string.split(//) 
    for i in 0..string.length-1
      stack.append('(') if string[i] == '('
      stack.append('{') if string[i] == '{'
      stack.append('[') if string[i] == '['
      if(string[i] == ')')
        if(stack.tail.value == '(')
          stack.pop
        else
          stack.append(string[i])
        end
      elsif(string[i] == '}')
        if(stack.tail.value == '{')
          stack.pop
        else
          stack.append(string[i])
        end
      elsif(string[i] == ']')
        if(stack.tail.value == '[')
          stack.append
        else
          stack.append(string[i])
        end
      end
    end
    return true if stack.length == 0
    return false if stack.length != 0
  end
  ################################################################

  def self.lru_cache_add(item)
    queue = DoublyLinkedList.new
    capacity = 3
    for i in 0..item.length-1
      if(queue.length < capacity)
        queue.unshift(item[i])
      else
        queue.pop
        queue.unshift(item[i])
      end
    end
    queue.head
  end
  ################################################################

  def self.lru_cache_get(cache, item)
    queue = cache
    while(queue.value != item  && queue.next != nil)
      queue = queue.next
    end    
    queue.value
    # delete the node from queue
    # unshift node in queue
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
      while(s2.length != 0 && s2.last > tmp)
        s1.push(s2.pop)
      end
      s2.push(tmp)
    end
    s2
  end
  ################################################################

  def self.queue_with_two_stacks(s1)
    # Enqueue will be the same as push method in stack    
    # For Dequeue the stack has to be reversed and then perform pop on reversed stack
    s2 = []
    while(s1.length > 0)
      last = s1.pop
      s2.push(last)
    end
    s2.pop
  end
  ################################################################
end

p StackQueueAlgorithm.queue_with_two_stacks([23,234,324,12,34,45345,456])





