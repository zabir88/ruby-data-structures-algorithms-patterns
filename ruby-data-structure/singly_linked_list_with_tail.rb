###### Array #########
# append: O(n)
# pop: O(1)
# prepend: O(n) 
# shift: O(n)
# access element: O(1)
# insert element: O(n)
# delete element: O(n)
# search : O(n)

###### Singly Linked List #########
# append: O(1)
# pop: O(n)
# prepend: O(1) 
# shift: O(1)
# access element: O(n)
# insert element: O(n)
# delete element: O(n)
# find : O(n)

class Node
  attr_accessor :value, :next
  def initialize(val = nil)
      @value = val
      @next = nil
  end
end

class SinglyLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = @head
  end

  def append(val)
    if(@head == nil)
      @head = Node.new(val)
      @tail = @head
    else
      node = Node.new(val)
      @tail.next = node
      # update tail
      @tail = node
    end
  end

  def pop
    current_node = @head
    # empty list
    return nil if current_node == nil
    # single element in list
    if(current_node.next == nil)
      @head = nil
      @tail = @head
      return current_node
    end
    while(current_node.next != nil)
      previous_node = current_node
      current_node = current_node.next
    end
    previous_node.next = nil
    # update tail
    @tail = previous_node
    current_node
  end

  def prepend(val)
    node = Node.new(val)
    if @head == nil
      @head = node
      @tail = @head
    else
      node.next = @head
      @head = node
    end
  end

  def shift
    return nil if @head == nil
    prev_head = @head
    @head = @head.next
    prev_head
  end

  def insert(val, index)
    node = Node.new(val)
    current_node = @head
    ind = 0
    while(ind != index)
      previous_node = current_node
      current_node = current_node.next
      ind += 1
    end
    previous_node.next = node
    node.next = current_node
  end

  def delete(val)
    current_node = @head
    # if list is empty
    return nil if current_node == nil
    # if value is the first element
    if(current_node.value == val)
      self.shift
      return current_node
    end
    while(current_node.next != nil)
      if(current_node.value == val) 
        break
      end
      previous_node = current_node
      current_node = current_node.next
    end
    # value not found
    return nil if current_node == nil
    # if value is the last element in the list
    if current_node.next == nil
      self.pop
      return current_node
    end
    # element found in between first and last element in the list
    previous_node.next = current_node.next
    current_node
  end

  def find(val)
    return nil if @head == nil
    current_node = @head
    while(current_node.next != nil)
      if (current_node.value == val)
        return current_node
      end
      current_node = current_node.next
    end
    nil
  end

  def reverse
    prev_node = nil
    current_node = @head
    new_tail = @head
    while(current_node != nil)
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    new_tail.next = nil
    @head = prev_node
    @tail = new_tail
  end

  def is_empty?
    @head == nil ? true : false
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
end
first = SinglyLinkedList.new
first.append(1)
first.append(2)
first.append(3)
first.reverse
p first
