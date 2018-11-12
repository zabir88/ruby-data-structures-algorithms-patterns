###### Array #########
# append: O(n)
# prepend: O(n) 
# pop: O(1) 
# shift: O(n)
# access element: O(1)
# insert element: O(n)
# delete element: O(n)
# search : O(n)
##### Array #########

###### Doubly Linked List ######
# append: O(1)
# prepend: O(1) 
# pop: O(1) 
# shift: O(1)
# access element: O(n)
# insert element: O(1)
# delete element: O(1)
# search: O(n)
###### Doubly Linked List ######

class Node
  attr_accessor :value, :next, :prev
  def initialize(value = nil, prev_node = nil, next_node = nil)
    @value = value
    @prev = prev_node
    @next = next_node
  end
end

class DoublyLinkedList 
  attr_reader :head, :tail, :length

  def initialize
    @head = Node.new
    @tail = @head
    @length = 0
  end

  def append(item)
    node = Node.new
    node.value = item
    if(@length > 0)
      node.prev = @tail
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = @head
    end
    @length += 1
  end

  def pop
    if(@length > 1)
      @tail = @tail.prev
      @tail.next = nil
      @length -= 1
    elsif(@length == 1)
      @head = Node.new
      @tail = @head
      @length = 0
    else
      raise "undefined method for nil nil:Class"
    end
  end

  def unshift(item)
    node = Node.new
    node.value = item
    if(@length > 0)
      node.next = @head
      @head.prev = node
      @head = node
    else
      @head = node
      @tail = @head
    end
    @length += 1
  end

  def shift
    if(@length > 1)
      @head = @head.next
      @head.prev = nil
      @length -= 1
    elsif(@length == 1)
      @head = Node.new
      @tail = @head
      @length = 0
    else
      raise 'undefined method for nil nil:Class'
    end
  end

  def get(ind)
    if(ind >= 0 && ind < @length)
      current_node = @head
      i = 0
      while(i != ind)
        current_node = current_node.next
        i += 1
      end
      return current_node.value 
    else
      raise 'Out of bound'
    end
  end

  def insert(el, ind)
    node = Node.new(el)
    if(ind >= 0 && ind < @length)
      current_node = @head
      i = 0
      while(i != ind)
        prev_node = current_node
        current_node = current_node.next
        i += 1
      end
      node.next = current_node
      node.prev = prev_node
      prev_node.next = node
      current_node.prev = node
      @length += 1
    else
      raise 'Out of bound'  
    end
  end

  def delete(el)
    current_node = @head
    while(current_node.value != el)
      prev_node = current_node
      current_node = current_node.next
      if(current_node.next == nil)
        raise "#{el} could not be found"
      end
    end 
    current_node.next.prev = prev_node
    prev_node.next = current_node.next
    @length -= 1
  end

  def search(el)
    current_node = @head
    ind = 0
    while(current_node.value != el)
      ind += 1
      current_node = current_node.next
      if(current_node.next == nil)
        raise "#{el} could not be found"
      end
    end
    ind
  end

  def reverse
  end

  def is_empty?
    @length <= 0 ? true : false
  end
end

first = DoublyLinkedList.new
first.append(1)
first.append(2)
first.append(3)
first.insert(4, 2)
first.delete(5)
p first.head




