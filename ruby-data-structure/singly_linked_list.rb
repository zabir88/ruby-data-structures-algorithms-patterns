###### Array #########
# append: O(n)
# prepend: O(n) 
# pop: O(1) 
# shift: O(n)
# access element: O(1)
# insert element: O(n)
# delete element: O(n)
# search : O(n)

###### Singly Linked List #########
# append: O(1)
# prepend: O(1) 
# pop: O(n) 
# shift: O(1)
# access element: O(n)
# insert element: O(n)
# delete element: O(n)
# search : O(n)

require 'byebug'

class Node
  attr_accessor :value, :next
  def initialize(val = nil)
      @value = val
      @next = nil
  end
end

class SinglyLinkedList
  attr_reader :head, :tail, :length

  def initialize
    @head = Node.new
    @tail = @head
    @length = 0
  end

  def append(item)
    if(@length > 0)
      node = Node.new(item)
      @tail.next = node 
      @tail = node
    else
      @head.value = item
      @tail = @head
    end
    @length += 1
  end

  def pop
    if(@length > 1)
      current_node = @head
      while(current_node.next != nil)
        second_last_node = current_node
        current_node = current_node.next
      end
      second_last_node.next = nil
      @tail = second_last_node
      @length -= 1
    elsif(@length == 1)
      @head, @tail, @length = nil, nil, 0
    else  
      raise "undefined method for nil nil:Class" 
    end
  end

  def unshift(item)
    if(@length < 1)
      @head.value = item
      @head.next = nil
      @tail = @head
    else
      node = Node.new(item)
      node.next = @head
      @head = node
    end
    @length += 1
  end

  def shift
    if(@length > 1)
      value = @head.value
      @head = @head.next
      @length -= 1
    elsif(@length == 1)
      value = @head.value
      @head, @tail = nil, nil
      @length = 0  
    else 
      raise 'undefined method for nil nil:Class'
    end
    value 
  end

  def get(ind)
    if(ind >= 0 && ind < @length)
      current_node = @head
      i = 0
      while(i != ind)
        current_node = current_node.next
        i += 1
      end
      current_node.value
    else
     return  nil
    end
  end

  def insert(item, ind)
    node = Node.new(item)
    if(@length > 0)  
      if(ind > 0 && ind < @length)
        current_node = @head
        i = 0
        while(i != ind)
          previous_node = current_node
          current_node = current_node.next
          i += 1
        end
        node.next = current_node
        previous_node.next = node
      elsif (ind == 0)
        node.next = @head
        @head = node 
      else
        raise 'Out of bound'
      end
    else
      @head = node
      @tail = @head
    end
    @length += 1
  end

  def delete(item)
    current_node = @head
    if(current_node.value == item)
      @head = @head.next
    elsif(@tail.value == item)
      while(current_node.next != nil)
        prev_node = current_node
        current_node = current_node.next
      end
      prev_node.next = nil
      @tail = prev_node 
    else
      while(current_node.value != item)
        previous_node = current_node
        current_node = current_node.next
        if(current_node == nil)
          raise "#{item} could not be found"
        end
      end
      previous_node.next = current_node.next
    end 
    @length -= 1
  end

  def search(item)
    current_node = @head
    ind = 0
    while(current_node.value != item  && current_node.next != nil)
      current_node = current_node.next
      ind += 1
      if(current_node.next == nil)
        return raise 'undefined method for nil: NilClass'
      end
    end
    ind
  end

  def reverse
    next_node, prev_node = nil, nil
    current_node = @head
    while(current_node != nil)
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    @head = prev_node
    # find_tail = @head
    # while(find_tail != nil)
    #   second_last_node = find_tail 
    #   find_tail = find_tail.next
    # end
    # @tail = second_last_node
  end

  def is_empty?
    @length <= 0 ? true : false
  end
end





