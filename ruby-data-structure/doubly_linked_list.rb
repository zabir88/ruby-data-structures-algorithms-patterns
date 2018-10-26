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
  end

  def insert(item, ind)
  end

  def delete(item)
  end

  def search(item)
  end

  def reverse
  end

  def is_empty?
    @length <= 0 ? true : false
  end
end

