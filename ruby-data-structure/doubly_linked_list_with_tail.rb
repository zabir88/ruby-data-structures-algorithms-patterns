###### Array #########
# append: O(n)
# prepend: O(n) 
# pop: O(1) 
# shift: O(n)
# access element: O(1)
# insert element: O(n)
# delete element: O(n)
# search : O(n)


###### Doubly Linked List ######
# append: O(1)
# prepend: O(1) 
# pop: O(1) 
# shift: O(1)
# access element: O(n)
# insert element: O(n)
# delete element: O(n)
# find: O(n)

class Node
  attr_accessor :value, :prev, :next
  def initialize(val)
    @value = val
    @prev, @next = nil, nil
  end
end

class DoublyLinkedListWithTail
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = @head
  end

  def append(val)
    if @head == nil
      @head = Node.new(val)
      @tail = @head
    else
      node = Node.new(val)
      node.prev = @tail     
      @tail.next = node
      @tail = node
    end
  end

  def pop
    return nil if @head == nil
    if @head.next == nil
      current_node = @head
      @head = nil
      @tail = @head
      return current_node
    end
    @tail = @tail.prev
    @tail.next = nil
  end

  def prepend(val)
    node = Node.new(val)
    if @head == nil
      @head = node
      @tail = @head
    end
    prev_head = @head
    prev_head.prev = node
    @head = node
    node.next = prev_head    
  end

  def shift
    return nil if @head == nil
    result = @head
    @head = @head.next
    @head.prev = nil
    result
  end

  def insert(val, index)
    return nil if @head == nil
    node = Node.new(val)
    current_node = @head
    ind = 0
    while(ind != index)
      ind +=1 
      current_node = current_node.next
      break if current_node == nil
    end
    return nil if current_node == nil
    prev_node = current_node.prev
    next_node = current_node.next
    node.prev = prev_node
    node.next = next_node
    prev_node.next = node
    next_node.prev = node
  end

  def delete(val)
    current_node = @head
    # list is empty
    return nil if current_node == nil
    # if first el in the list
    if current_node.value == val
      self.shift
      return current_node
    end
    while(current_node.next != nil)
      if(current_node.value == val)
        break
      end
      current_node = current_node.next
    end
    # element not found in list
    return nil if current_node == nil
    # if last element in the list
    if(current_node.next == nil)
      self.pop
      return current_node
    end
    # element found in between first and last element in the list 
    prev_node = current_node.prev
    next_node = current_node.next
    prev_node.next = next_node
    next_node.prev = prev_node
    current_node
  end

  def find(val)
    # when empty list
    return nil if @head == nil
    # when not empty list
    current_node = @head
    while(current_node.next != nil)
      if(current_node.value == val)
        return current_node
      end
      current_node = current_node.next
    end
    nil
  end

  def reverse
  end

  def length
    return 0 if @head == nil
    count = 0
    current_node = @head
    while(current_node != nil)
      count += 1
      current_node = current_node.next
    end
    count
  end

  def is_empty?
    @head == nil ? true : false
  end
end

first = DoublyLinkedListWithTail.new
first.append(1)
first.append(2)
first.prepend(0)
p first.head
first.delete(1)
p first.head
