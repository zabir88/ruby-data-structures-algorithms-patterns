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

  def self.lru_cache_get(cache, 2)
    queue = DoublyLinkedList.new
    capacity = 3

  end
  ################################################################

  def self.min_in_stack
  end
  ################################################################

  def self.sort_stack(s1)
    while(s1.length != 0)
      out = s1.pop
      s2 = []
      if(s2.length == 0)
        s2.append(out)
      else
        for i in 0..s2.length-1
          if(out < s2[i])
            last_one = s2.pop
            s2.push(out)
            s2.push(last_one)
          else
            s2.push(out)
          end
        end
      end
    end
    s2
  end
  ################################################################

  def self.queue_with_two_stacks
  end
  ################################################################
end

p StackQueueAlgorithm.lru_cache_get([1,2,3], 2)






